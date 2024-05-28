
putchr(c)
char c;
{
#asm
	pop	h
	pop	b
	push	b
	push	h
	jmp	0c037h
#endasm
}
