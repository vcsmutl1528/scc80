
include macros80.inc

extrn	main
extrn	SCCSTKTOP

	pop	h
	lxi	ps,SCCSTKTOP
	push	h
	jmp	main

endall
