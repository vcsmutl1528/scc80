
beepa(f,l)
unsigned char f, l;
{
#asm
	pop	d
	pop	b
	pop	h
	push	h
	push	b
	push	d
	mov	h,c
	shld	8ff1h
	jmp	0c170h
#endasm
}
