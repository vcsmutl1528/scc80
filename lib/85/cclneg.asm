
include macros80.inc

; HL = !HL
@clneg: mov     a,h
        ora     l
        jz      cclneg1
        lxi     h,0
        ret
cclneg1: inx     h
        ret

public	@clneg

endall
