
include macros80.inc

; HL = ~HL
@ccom:  mov     a,h
        cma
        mov     h,a
        mov     a,l
        cma
        mov     l,a
        ret

public	@ccom

endall
