
include macros80.inc

; HL = DE - HL
@csub:  mov     a,e
        sub     l
        mov     l,a
        mov     a,d
        sbb     h
        mov     h,a
        ret

public	@csub

endall
