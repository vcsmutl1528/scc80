
clsc(c)
char c;
{
#asm
	pop	d
	pop	h
	push	h
	push	d
	mov	h,l
	shld	08ffah
	jmp	0c010h
#endasm
}
