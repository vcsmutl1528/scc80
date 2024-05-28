
include macros80.inc

; signed compare of DE and HL
;   carry is sign of difference [set => DE < HL]
;   zero is zero/non-zero
@ccmp:  mov     a,e
        sub     l
        mov     e,a
        mov     a,d
        sbb     h
        lxi     h,1             ;preset true
        jm      cccmp1
        ora     e               ;resets carry
        ret
cccmp1: ora     e
        stc
        ret

public	@ccmp

endall
