
memcopy(dst,src,end)
int *dst, *src, *end;
{
#asm
	pop	h
	pop	d
	pop	h
	pop	b
	call	0c42dh
	push	b
	push	h
	push	d
	dcx	ps
	dcx	ps
	ret
#endasm
}
