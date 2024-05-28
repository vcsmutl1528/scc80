
delay(n)
int n;
{
#asm
	pop	h
	pop	b
	push	b
	push	h
dly:	dcx	b
	mov	a,c
	ora	b
	jnz	dly
#endasm
}
