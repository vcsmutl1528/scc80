
include macros80.inc

; {DE = -DE}
@cdeneg:
        mov     a,d
        cma
        mov     d,a
        mov     a,e
        cma
        mov     e,a
        inx     d
        ret

public	@cdeneg

endall
