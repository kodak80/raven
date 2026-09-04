
DEPS = asm56k dsp56303.inc
OBJS = boot.p56
A56 = bin/asm56k
AFLAGS = -c 56301

.PHONY: clean asm56k dsptools

all: asm56k dsptools # $(OBJS)

asm56k:
	make -C asm56k
	mkdir -p bin
	cp asm56k/build/asm56k bin/asm56k
	cp asm56k/tools/cldlod bin/cldlod
	cp asm56k/tools/lod2p56 bin/lod2p56
	cp asm56k/tools/cldinfo bin/cldinfo

dsptools:
	make -C dsptools/asm56000c
	make -C dsptools/cldlod
	make -C dsptools/lod2p56
	mkdir -p bin
	cp dsptools/asm56000c/asm56000 bin/asm56000

%.p56: %.asm $(DEPS)
	$(A56) $(AFLAGS) -p $(basename $@).p56 $<
	$(A56) $(AFLAGS) -e $(basename $@).a56 $<
	$(A56) $(AFLAGS) -k $(basename $@).c56 $<
	$(A56) $(AFLAGS) -s -o $(basename $@).lod $<

clean:
	make -C asm56k clean
	rm -f dsptools/asm56000c/asm56000
	rm -f dsptools/cldlod/cldlod
	rm -f dsptools/lod2p56/lod2p56
	rm -f $(OBJS) $(OBJS:.p56=.lod) $(OBJS:.p56=.a56) $(OBJS:.p56=.c56)
	rm -f bin/*
