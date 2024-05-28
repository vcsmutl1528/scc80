
AFLAGS = /ml

OBJS = cls.obj clsc.obj putchr.obj putstr.obj cursor.obj beep.obj beepa.obj \
	readkey.obj memcopy.obj delayn.obj mscrlscr.obj reset.obj s0spc.obj

.c.obj:
	scc8080 -a $*.c
	tasm $(AFLAGS) $*.s
	tlib /C /0 scc80spc +- $*

.asm.obj:
	tasm $(AFALGS) $*
	tlib /C /0 scc80spc +- $*

all: $(OBJS)

clean:
	del *.obj
	del *.s
