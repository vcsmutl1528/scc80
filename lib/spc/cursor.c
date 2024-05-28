
cursor(x,y)
int x, y;
{
#asm
	pop	d
	pop	h
	pop	b
	push	b
	push	h
	push	d
	mov	h,c
	shld	08ffch
#endasm
}
