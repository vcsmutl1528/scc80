
putstr(s)
char *s;
{
#asm
	pop	d
	pop	h
	push	h
	push	d
	jmp	0c438h
#endasm
}