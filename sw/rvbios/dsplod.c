/*-------------------------------------------------------------------------------
 * Raven support software
 * (c) 2024-2026 Anders Granlund
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

#include <stdint.h>
#include <mint/osbind.h>

#define DSPSTART		0
#define DSPDATA         1
#define DSPBLOCK        2
#define DSPSYMBOL       3
#define DSPCOMMENT		4
#define DSPEND          5
#define NUMTOKENS       6

static const char *tokens[NUMTOKENS] = { "START", "DATA", "BLOCKDATA", "SYMBOL", "COMMENT", "END" };
static const int token_lengths[NUMTOKENS] = { 5, 4, 9, 6, 7, 3 };

static uint8_t *binbuff;
static uint8_t *curptr;
static uint8_t *bufend;
static uint32_t binindex;
static long size_count;

static int streq(char *bufstr, const char *tablestr, int len) {
	int i;
	for (i = 0; i < len; i++) {
		if ((bufstr[i] != tablestr[i]) && (bufstr[i] != (tablestr[i] + 32))) {
			return 0;
		}
	}
	return 1;
}
static int is_token(void) {
	if(*curptr == '_') {
		curptr++;
		return 1;
	}
	return 0;
}

static int get_token(void) {
	int i;
	for (i = 0; i < NUMTOKENS; i++) {
		if (streq((char*)curptr, tokens[i], token_lengths[i]))
			break;
	}
	return i;
}

static int iseol(void) {
	return ((*curptr==0x0D)||(*curptr==0x0A));
};

static void newline(void) {
	while(curptr <= bufend && (!iseol())) { curptr++; }
	while(curptr <= bufend && ( iseol())) { curptr++; }
}

static unsigned long make_long(void) {
	int i;
	unsigned long val = 0;
	for (i = 0; i < 6; i++) {
		unsigned long temp;
		if (*curptr >= '0' && *curptr <= '9')
			temp = *curptr - '0';
		else if (*curptr >= 'A' && *curptr <= 'F')
			temp = (*curptr - 'A') + 10;
		else if (*curptr >= 'a' && *curptr <= 'f')
			temp = (*curptr - 'a') + 10;
		else
			break;
		curptr++;
		val = (val << 4) | temp;
	}
	return val;
}

static void put_dspword(unsigned char a, unsigned char b, unsigned char c) {
	binbuff[binindex++] = a;
	binbuff[binindex++] = b;
	binbuff[binindex++] = c;
	size_count++;
}

static long stuff_header(char memtype) {
	unsigned long block_loc;
	long size_loc_index;

	binbuff[binindex++] = 0;
	binbuff[binindex++] = 0;
	if (memtype == 'P')	{
		binbuff[binindex++] = 0;
	} else if (memtype == 'X') {
		binbuff[binindex++] = 1;
	} else if (memtype == 'Y') {
		binbuff[binindex++] = 2;
	} else {
		return 0;
	}

	block_loc = make_long();
	binbuff[binindex++] = (unsigned char) ((block_loc >> 16) & 0xff);
	binbuff[binindex++] = (unsigned char) ((block_loc >>  8) & 0xff);
	binbuff[binindex++] = (unsigned char) ((block_loc >>  0) & 0xff);

	size_count = 0;
	size_loc_index = binindex;
	binindex += 3;
	newline();
	return size_loc_index;
}

static void make_dspword(void) {
	int i, j;
	unsigned char ch[3];

	for (i = 0; i < 3; i++) {
		char val = 0;
		char mult = 16;
		for (j = 0; j < 2; j++) {
			char temp;
			if (*curptr >= '0' && *curptr <= '9') {
				temp = (*curptr - '0');
			} else if (*curptr >= 'A' && *curptr <= 'F') {
				temp = (*curptr - 'A') + 10;
			} else {
				temp = (*curptr - 'a') + 10;
			}
			curptr++;
			val += temp * mult;
			mult /= 16;
		}
		ch[i] = val;
	}
	put_dspword(ch[0], ch[1], ch[2]);
}

static void convert_line(void) {
	while (curptr < bufend && !iseol()) {
		while (curptr < bufend && *curptr == ' ')
			curptr++;
		if (curptr < bufend && !iseol())
			make_dspword();
	}
}

static int do_convert(void) {
	char memtype;
	long size_loc_index;

	curptr += token_lengths[DSPDATA];
	while (curptr < bufend && *curptr == ' ') {
		curptr++;								
	}

	memtype = *curptr++;
	while (curptr < bufend && *curptr == ' ') {
		curptr++;
	}

	size_loc_index = stuff_header(memtype);
	if (size_loc_index == 0) {
		return 0;
	}

	while ((curptr < bufend) && !is_token()) {
		if (iseol()) {
			newline();
		} else {
			convert_line();
		}
	}

	binbuff[size_loc_index++] = (unsigned char) ((size_count >> 16) & 0xff);
	binbuff[size_loc_index++] = (unsigned char) ((size_count >>  8) & 0xff);
	binbuff[size_loc_index++] = (unsigned char) ((size_count >>  0) & 0xff);
	return 1;
}

int32_t xbc_dsp_lodtobin(char* filename, uint8_t* buffer) {
	int32_t fi = Fopen(filename, 0);
	if (fi >= 0) {
		int token;
		long fisize = Fseek(0, (int16_t)fi, 2);
		uint8_t* fidata = (uint8_t*) Malloc(fisize);
		Fseek(0, (int16_t)fi, 0);
		Fread((int16_t)fi, fisize, fidata);
		Fclose((int16_t)fi);

		curptr = fidata;
		bufend = curptr + fisize;
		binindex = 0L;
		binbuff = buffer;
		while(!is_token()) {
			newline();
		}
		while((token = get_token()) != DSPEND) {
			if (token == DSPDATA) {
				do_convert();
			} else {
				newline();
				while(!is_token()) {
					newline();
				}
			}
		}
		Mfree(fidata);
		return (binindex/3);
	}
	return 0;
}
