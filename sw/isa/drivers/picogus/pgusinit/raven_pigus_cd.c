/*
 * pguscd.xdd - PicoGUS CD-ROM emulation driver for Raven/EmuTOS
 *
 * Exposes the PicoGUS CD emulation as an XHDI CD-ROM device so ExtenDOS 4
 * can mount ISO images loaded via pgusinit /cdload.
 *
 * Build: m68k-atari-mintelf-gcc -Os -fomit-frame-pointer -nostdlib ...
 */

#include <mint/osbind.h>
#include <mint/cookie.h>
#include <stdint.h>
#include <stdbool.h>
#include "../common/picogus.h"   /* your header with CONTROL_PORT, CMD_CDPORT, etc. */
#include "../../../../rom/emutos/bios/xhdi.h"      /* XHDI interface header (from EmuTOS / ExtenDOS SDK) */

/* -------------------------------------------------------------------------- */
/* Low-level ISA I/O helpers (reuse what you already use in pgusinit)        */
/* -------------------------------------------------------------------------- */

static inline uint8_t inb(uint16_t port)
{
    /* On Raven, this should map to your ISA read helper.
       If you already have inp()/outp() macros, just use those. */
    return inp(port);
}

static inline void outb(uint16_t port, uint8_t val)
{
    outp(port, val);
}

static inline uint16_t inw(uint16_t port)
{
    return inpw(port);
}

static inline void outw(uint16_t port, uint16_t val)
{
    outpw(port, val);
}

/* -------------------------------------------------------------------------- */
/* PicoGUS CD base port discovery                                             */
/* -------------------------------------------------------------------------- */

static uint16_t pgus_cd_base = 0;   /* IDE/ATAPI base port for CD emulation */

/* Read CD base port from PicoGUS control registers */
static bool pgus_cd_read_base_port(void)
{
    /* Knock on the door and select CD port register */
    outb(CONTROL_PORT, CMD_CDPORT);
    pgus_cd_base = inw(DATA_PORT_LOW);

    if (pgus_cd_base == 0) {
        Cconws("pguscd: invalid CD base port (0)\r\n");
        return false;
    }

    return true;
}

/* -------------------------------------------------------------------------- */
/* IDE/ATAPI register layout at pgus_cd_base                                  */
/* -------------------------------------------------------------------------- */
/*
 * Standard IDE primary channel layout:
 *   base + 0: data (16-bit)
 *   base + 1: error/features
 *   base + 2: sector count
 *   base + 3: LBA low
 *   base + 4: LBA mid
 *   base + 5: LBA high
 *   base + 6: drive/head
 *   base + 7: status/command
 *
 * ATAPI uses PACKET command (0xA0) and 12-byte/16-byte SCSI-like packets.
 */

#define IDE_REG_DATA      (pgus_cd_base + 0)
#define IDE_REG_ERROR     (pgus_cd_base + 1)
#define IDE_REG_FEATURES  (pgus_cd_base + 1)
#define IDE_REG_SECCNT    (pgus_cd_base + 2)
#define IDE_REG_LBALOW    (pgus_cd_base + 3)
#define IDE_REG_LBAMID    (pgus_cd_base + 4)
#define IDE_REG_LBAHIGH   (pgus_cd_base + 5)
#define IDE_REG_DRIVEHEAD (pgus_cd_base + 6)
#define IDE_REG_STATUS    (pgus_cd_base + 7)
#define IDE_REG_COMMAND   (pgus_cd_base + 7)

/* Status bits */
#define IDE_STATUS_ERR    0x01
#define IDE_STATUS_DRQ    0x08
#define IDE_STATUS_BUSY   0x80

/* ATAPI command */
#define ATAPI_CMD_PACKET  0xA0

/* -------------------------------------------------------------------------- */
/* Simple wait helpers                                                        */
/* -------------------------------------------------------------------------- */

static bool ide_wait_not_busy(void)
{
    uint32_t timeout = 1000000;
    while (timeout--) {
        uint8_t st = inb(IDE_REG_STATUS);
        if (!(st & IDE_STATUS_BUSY))
            return true;
    }
    return false;
}

static bool ide_wait_drq(void)
{
    uint32_t timeout = 1000000;
    while (timeout--) {
        uint8_t st = inb(IDE_REG_STATUS);
        if (st & IDE_STATUS_ERR)
            return false;
        if (st & IDE_STATUS_DRQ)
            return true;
    }
    return false;
}

/* -------------------------------------------------------------------------- */
/* ATAPI helpers: send PACKET, read data                                      */
/* -------------------------------------------------------------------------- */

/* Send a 12-byte ATAPI packet */
static bool atapi_send_packet(const uint8_t *pkt, uint16_t xfer_bytes)
{
    if (!ide_wait_not_busy())
        return false;

    /* Select device (master) */
    outb(IDE_REG_DRIVEHEAD, 0xA0);

    /* Set transfer size (in words) for ATAPI */
    outb(IDE_REG_FEATURES, 0);                 /* no special features */
    outb(IDE_REG_SECCNT, (xfer_bytes >> 8));   /* high byte */
    outb(IDE_REG_LBALOW, (xfer_bytes & 0xFF)); /* low byte */
    outb(IDE_REG_LBAMID, 0);
    outb(IDE_REG_LBAHIGH, 0);

    /* Issue PACKET command */
    outb(IDE_REG_COMMAND, ATAPI_CMD_PACKET);

    if (!ide_wait_drq())
        return false;

    /* Write packet (12 bytes = 6 words) */
    const uint16_t *w = (const uint16_t *)pkt;
    for (int i = 0; i < 6; ++i) {
        outw(IDE_REG_DATA, w[i]);
    }

    return true;
}

/* Read n bytes of data into buffer (multiple of 2048 for CD sectors) */
static bool atapi_read_data(uint8_t *buf, uint32_t bytes)
{
    uint32_t words = bytes / 2;

    if (!ide_wait_drq())
        return false;

    uint16_t *w = (uint16_t *)buf;
    for (uint32_t i = 0; i < words; ++i) {
        w[i] = inw(IDE_REG_DATA);
    }

    return true;
}

/* -------------------------------------------------------------------------- */
/* ATAPI READ(10) implementation (2048-byte sectors)                          */
/* -------------------------------------------------------------------------- */

static bool atapi_read10(uint32_t lba, uint16_t count, uint8_t *buf)
{
    /* 12-byte READ(10) packet:
     *  [0] 0x28 (READ(10))
     *  [1] flags
     *  [2..5] LBA
     *  [6] reserved
     *  [7..8] transfer length (blocks)
     *  [9] control
     */
    uint8_t pkt[12] = {0};

    pkt[0] = 0x28; /* READ(10) */
    pkt[2] = (lba >> 24) & 0xFF;
    pkt[3] = (lba >> 16) & 0xFF;
    pkt[4] = (lba >> 8) & 0xFF;
    pkt[5] = (lba) & 0xFF;
    pkt[7] = (count >> 8) & 0xFF;
    pkt[8] = (count) & 0xFF;

    /* Total bytes to read = count * 2048 */
    uint32_t total_bytes = (uint32_t)count * 2048;

    if (!atapi_send_packet(pkt, total_bytes))
        return false;

    if (!atapi_read_data(buf, total_bytes))
        return false;

    return true;
}

/* -------------------------------------------------------------------------- */
/* XHDI interface glue                                                        */
/* -------------------------------------------------------------------------- */

#define PGUSCD_DEVNUM  0   /* our single device index */

static XHDI_COOKIE xhdi_cookie;

/* XHDI: get number of devices */
static long xhdi_get_devices(void)
{
    return 1; /* one CD-ROM device */
}

/* XHDI: get device info */
static long xhdi_get_info(long dev, XHDI_DEVICE_INFO *info)
{
    if (dev != PGUSCD_DEVNUM)
        return EINVFN;

    info->flags = XHDI_DEVFLAG_READONLY | XHDI_DEVFLAG_REMOVABLE;
    info->block_size = 2048;   /* CD sector size */
    info->blocks = 0xFFFFFFFF; /* unknown, ExtenDOS will query TOC */
    info->type = XHDI_DEVTYPE_CDROM;

    return 0;
}

/* XHDI: read/write (we only support read) */
static long xhdi_rw(long dev, long rw, uint32_t start, uint32_t count, void *buf)
{
    if (dev != PGUSCD_DEVNUM)
        return EINVFN;

    if (rw != XHDI_RW_READ)
        return EACCDN; /* write not allowed */

    if (!atapi_read10(start, (uint16_t)count, (uint8_t *)buf))
        return EREAD;

    return 0;
}

/* Minimal XHDI dispatch table */
static long xhdi_dispatch(long fn, long arg1, long arg2, long arg3, long arg4)
{
    switch (fn) {
        case XHDI_FN_GET_DEVICES:
            return xhdi_get_devices();

        case XHDI_FN_GET_INFO:
            return xhdi_get_info(arg1, (XHDI_DEVICE_INFO *)arg2);

        case XHDI_FN_RW:
            return xhdi_rw(arg1, arg2, (uint32_t)arg3, (uint32_t)arg4,
                           (void *)*((long *)(&arg4 + 1))); /* depends on ABI */

        default:
            return EINVFN;
    }
}

/* -------------------------------------------------------------------------- */
/* Driver init / cookie installation                                          */
/* -------------------------------------------------------------------------- */

static void install_xhdi_cookie(void)
{
    long *cookie_jar;
    if (Getcookie(_CXHDI, (long *)&cookie_jar) == C_FOUND) {
        /* XHDI already present; we’d normally chain, but for a simple
           dedicated CD driver you can just bail or replace. */
        Cconws("pguscd: XHDI already installed\r\n");
        return;
    }

    xhdi_cookie.version = 0x0100;      /* XHDI 1.0 */
    xhdi_cookie.server = (long)xhdi_dispatch;

    Setcookie(_CXHDI, (long)&xhdi_cookie);
}

/* Entry point called at boot (PRG/XDD style) */
int main(void)
{
    if (!pgus_cd_read_base_port()) {
        Cconws("pguscd: no PicoGUS CD port\r\n");
        return 1;
    }

    /* TODO: optionally probe ATAPI signature at pgus_cd_base here
       (read LBA mid/high, expect 0xEB/0x14 or similar). */

    install_xhdi_cookie();

    Cconws("pguscd: PicoGUS CD-ROM driver installed\r\n");
    return 0;
}
