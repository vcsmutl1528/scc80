
include macros80.inc

; {BC : DE}
@ccmpbd:
        mov     a,e
        sub     c
        mov     a,d
        sbb     b
        ret

public	@ccmpbd

endall
