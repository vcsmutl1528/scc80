
include macros80.inc

; unsigned compare of DE and HL
;   carry is sign of difference [set => DE < HL]
;   zero is zero/non-zero
@cucmp: mov     a,d
        cmp     h
        jnz     ccucmp1
        mov     a,e
        cmp     l
ccucmp1: lxi     h,1             ;preset true
        ret

public	@cucmp

endall
