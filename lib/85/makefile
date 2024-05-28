
AFLAGS = /ml

OBJS = ccgchar.obj ccand.obj ccasl.obj ccasr.obj ccbcneg.obj ccbool.obj \
	cccase.obj cccmp.obj cccmpbd.obj cccom.obj ccdeneg.obj cceq.obj \
	ccge.obj ccgt.obj ccle.obj cclneg.obj cclsr.obj cclt.obj ccmul.obj \
	ccne.obj ccneg.obj ccor.obj ccrdel.obj ccsub.obj ccucmp.obj \
	ccudiv.obj ccuge.obj ccugt.obj ccule.obj ccult.obj ccxor.obj \
	ccdiv.obj abs.obj atoi.obj itoa.obj strlen.obj strcmp.obj strcat.obj \
	strcpy.obj strncmp.obj strncat.obj strncpy.obj chrclass.obj \
	sbinary.obj rand.obj reverse.obj shellsrt.obj sprintn.obj strindex.obj

.asm.obj:
	tasm $(AFLAGS) $*
	tlib /C /0 scc8085 +- $*

.c.obj:
	scc8080 -au $*.c
	tasm $(AFLAGS) $*.s
	tlib /C /0 scc8085 +- $*

all: $(OBJS)

clean:
	del *.obj
	del *.s
