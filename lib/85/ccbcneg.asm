
include macros80.inc

; {BC = -BC}
@cbcneg:
        mov     a,b
        cma
        mov     b,a
        mov     a,c
        cma
        mov     c,a
        inx     b
        ret

public	@cbcneg

endall
