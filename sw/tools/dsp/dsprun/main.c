/*-------------------------------------------------------------------------------
 * dsp test prog
 * (c)2026 Anders Granlund
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

uint8_t* loadfile(char* filename, uint32_t* size) {
	FILE* f = fopen(filename, "rb");
	if (f) {
		uint8_t* p = 0;
		uint32_t s = 0;
		fseek(f, 0, SEEK_END);
		s = ftell(f);
		fseek(f, 0, SEEK_SET);
		if (s > 0) {
			p = (uint8_t*)Malloc(s);
			if (p) {
				fread(p, s, 1, f);
				fclose(f);
				*size = s;
				return p;
			}
		}
		fclose(f);
	}
	return 0;
}

static uint32_t get32(uint8_t* p) { return ((((uint32_t)p[0]) << 16) | (((uint32_t)p[1])<<8) | (((uint32_t)p[2])<<0)); }

void infoprog(uint8_t* p, uint32_t len)
{
#if 1
	uint8_t* e = (p + len);
	while (p < e)
	{
		char type;
		uint32_t hdr_space = get32(p+0);
		uint32_t hdr_offset = get32(p+3);
		uint32_t hdr_size = get32(p+6);
		/*printf("%06lx %06lx %06lx\n", hdr_space, hdr_offset, hdr_size);*/
		if (hdr_space == 0) { type = 'P'; }
		else if (hdr_space == 1) { type = 'X'; }
		else if (hdr_space == 2) { type = 'Y'; }
		else { break; }
		printf("%c : %06lx : %06lx\n", type, hdr_offset, hdr_size);
		p += ((hdr_size + 3) * 3);
	}
#endif	
}

int loadbin(char* filename) {
	uint32_t fsize = 0;
	uint8_t* p = loadfile(filename, &fsize);
	if (p) {
		uint32_t len = fsize / 3;
		printf("Loaded prog %s : %ld words\n", filename, len);
		infoprog(p, len);
		Dsp_ExecProg(p, len, 0);
		Mfree(p);
		return 0;
	}
	return -1;
}

int loadlod(char* filename) {
	int result = -1;
	uint8_t* p = Malloc(1024UL * 3 * 128);
	if (p) {
#if 0
		result = Dsp_LoadProg(filename, 0, p);
#else
		long len = Dsp_LodToBinary(filename, p);
		if (len > 0) {
			printf("Loaded prog %s : %ld words\n", filename, len);
			infoprog(p, len);
			Dsp_ExecProg(p, len, 0);
			result = 0;
		}
#endif		
		Mfree(p);
	}
	return result;
}

long supermain(int args, char** argv) {
	char* fname;
	int result;
	if (args < 2) {
		printf("dsprun <file.p56/lod>\n");
		return 0;
	}

	/* shouldn't be hardcoded here but for now it is */
	/* in case a test program wants to route YM sound through the DSP */
	raven()->snd_volume(0);

	fname = argv[1];
	if (strstr(fname, ".lod") || strstr(fname, ".LOD")) {
		result = loadlod(fname);
	} else {
		result = loadbin(fname);
	}

	if (result != 0) {
		printf("fail loading %s\n");
	}

	return (long)result;
}

int main(int args, char** argv) {
    return (int) Supmain(args, argv, supermain);
}
