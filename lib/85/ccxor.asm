
include macros80.inc

; "xor" HL and DE into HL
@cxor:  mov     a,l
        xra     e
        mov     l,a
        mov     a,h
        xra     d
        mov     h,a
        ret

public	@cxor

endall
