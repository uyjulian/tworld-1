CC = gcc
CFLAGS = -Wall -W -O2 -fomit-frame-pointer
#CFLAGS = -Wall -W -ggdb
LDLFAGS = -Wall -W
LOADLIBES =

CFLAGS += '-DDATADIR="/usr/local/share/tworld"'

CFLAGS += $(shell sdl-config --cflags)
LOADLIBES += $(shell sdl-config --libs)

OBJS = \
tworld.o series.o play.o solution.o lxlogic.o mslogic.o help.o score.o \
random.o cmdline.o fileio.o err.o liboshw.a

tworld: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LOADLIBES)

tworld.o   : tworld.c defs.h gen.h err.h fileio.h series.h solution.h	\
             play.h score.h oshw.h help.h random.h cmdline.h
series.o   : series.c series.h defs.h gen.h err.h fileio.h solution.h
play.o     : play.c play.h defs.h gen.h err.h fileio.h state.h random.h	\
             mslogic.h lxlogic.h oshw.h random.h solution.h
lxlogic.o  : lxlogic.c lxlogic.h defs.h gen.h err.h state.h random.h
mslogic.o  : mslogic.c mslogic.h defs.h gen.h err.h state.h random.h
solution.o : solution.c solution.h defs.h gen.h err.h fileio.h
help.o     : help.c help.h defs.h gen.h state.h oshw.h
score.o    : score.c score.h defs.h gen.h err.h play.h
random.o   : random.c random.h defs.h gen.h
cmdline.o  : cmdline.c cmdline.h gen.h
fileio.o   : fileio.c fileio.h defs.h gen.h err.h
err.o      : err.c oshw.h err.h

liboshw.a: defs.h gen.h oshw.h oshw/*.c oshw/*.h
	(cd oshw && make)


mklynxcc: mklynxcc.c
	$(CC) -Wall -W -o $@ $^


install: tworld
	cp -i ./tworld /usr/local/games/.

clean:
	rm -f $(OBJS) tworld mklynxcc
	(cd oshw && make clean)
