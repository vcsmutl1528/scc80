
include macros80.inc

; fetch int from (HL)
@cgint: mov     a,m
        inx     h
        mov     h,m
        mov     l,a
        ret

public	@cgint

endall
