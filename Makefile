TARGET_LIB = libsmpeg.a
OBJS = MPEG.o MPEGfilter.o MPEGlist.o MPEGring.o MPEGstream.o MPEGsystem.o smpeg.o audio/bitwindow.o audio/filter_2.o audio/filter.o audio/hufftable.o audio/MPEGaudio.o audio/mpeglayer1.o audio/mpeglayer2.o audio/mpeglayer3.o audio/mpegtable.o audio/mpegtoraw.o

PSPDEV=$(shell psp-config --pspdev-path)
PSPSDK=$(shell psp-config --pspsdk-path)

INCDIR = 
CFLAGS = $(GLOBAL_CFLAGS) -O2 -Wall -g `$(PSPDEV)/psp/bin/sdl-config --cflags`
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

LDFLAGS = 
LIBS = `$(PSPDEV)/psp/bin/sdl-config --libs`

include $(PSPSDK)/lib/build.mak

install: $(TARGET_LIB)
	@cp -v $(TARGET_LIB) `psp-config --pspdev-path`/psp/lib
	@cp -v *.h `psp-config --pspdev-path`/psp/include
	@echo "Done."

