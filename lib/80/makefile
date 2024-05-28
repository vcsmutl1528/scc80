
AFLAGS = /ml

OBJS = ccand.obj ccasl.obj ccasr.obj ccbcneg.obj ccbool.obj cccase.obj \
	cccmp.obj cccmpbd.obj cccom.obj ccdeneg.obj ccdiv.obj cceq.obj \
	ccgchar.obj ccge.obj ccgint.obj ccgt.obj ccle.obj cclneg.obj \
	cclsr.obj cclt.obj ccmul.obj ccne.obj ccneg.obj ccor.obj ccpchar.obj \
	ccpint.obj ccrdel.obj ccsub.obj ccucmp.obj ccudiv.obj ccuge.obj \
	ccugt.obj ccule.obj ccult.obj ccxor.obj cguchar.obj abs.obj atoi.obj \
	itoa.obj strlen.obj strcmp.obj strcat.obj strcpy.obj strncmp.obj \
	strncat.obj strncpy.obj chrclass.obj sbinary.obj rand.obj reverse.obj \
	shellsrt.obj sprintn.obj strindex.obj

.asm.obj:
	tasm $(AFLAGS) $*
	tlib /C /0 scc8080 +- $*

.c.obj:
	scc8080 -a $*.c
	tasm $(AFLAGS) $*.s
	tlib /C /0 scc8080 +- $*

all: $(OBJS)

clean:
	del *.obj
	del *.s
