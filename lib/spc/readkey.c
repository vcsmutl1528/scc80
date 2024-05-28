
readkey() {
#asm
	call	0c337h
	mov	l,a
	mvi	h,0
#endasm
}
