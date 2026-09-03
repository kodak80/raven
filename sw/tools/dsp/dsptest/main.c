/*-------------------------------------------------------------------------------
 * dsptest
 * (c)2026 Anders Granlund
 *
 * simple harness for quick and dirty test code
 *-------------------------------------------------------------------------------
 * This file is free software  you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation  either version 2, or (at your option)
 * any later version.
 *
 * This file is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY  without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program  if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *-----------------------------------------------------------------------------*/
#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <mint/osbind.h>
#include <mint/falcon.h>
#include "raven.h"
#include "sysutil.h"

#include "dsp_sram.c56"

static uint8_t tempbuf[1024UL * 64 * 3];
extern void readbuf(uint8_t* buf, uint32_t num);

long test_sram(void)
{
	uint32_t i,j;
	long result = 0;

	printf("load\n");
	Dsp_ExecProg(EmbededP56_dsp_sram, sizeof(EmbededP56_dsp_sram)/3, 0);

	printf("read\n");
	for (i=0; i<62; i++) {
		uint32_t addr = 1024UL * (2 + i);
		Dsp_DoBlock(0, 0, tempbuf, 1024UL);
		for (j=0; j<1024; j++) {
			uint8_t* ptr = &tempbuf[j * 3];
			uint32_t r = 0x550000UL | ((1024UL * (2 + i)) + j);
			uint32_t v = 0;
			v |= ptr[0]; v <<= 8;
			v |= ptr[1]; v <<= 8;
			v |= ptr[2];
			if (j == 0) {
				printf("y: %06lx : %06lx\n", addr, v);
			}
			if (r != v) {
				printf("** err: %06lx / %06lx\n", v, r);
				result = -1;
				break;
			}
		}
	}

	for (i=0; i<61; i++) {
		uint32_t addr = 1024UL * (2 + i);
		Dsp_DoBlock(0, 0, tempbuf, 1024UL);
		for (j=0; j<1024; j++) {
			uint8_t* ptr = &tempbuf[j * 3];
			uint32_t r = 0xaa0000UL | ((1024UL * (2 + i)) + j);
			uint32_t v = 0;
			v |= ptr[0]; v <<= 8;
			v |= ptr[1]; v <<= 8;
			v |= ptr[2];
			if (j == 0) {
				printf("x: %06lx : %06lx\n", addr, v);
			}
			if (r != v) {
				printf("** err: %06lx / %06lx\n", v, r);
				result = -2;
				break;
			}
		}
	}
	return result;
}

long supermain(int args, char** argv) {
	(void)args; (void)argv;
	printf("wordsize = %d\n", Dsp_GetWordSize());
	test_sram();
	return 0;
}

int main(int args, char** argv) {
    return (int) Supmain(args, argv, supermain);
}
