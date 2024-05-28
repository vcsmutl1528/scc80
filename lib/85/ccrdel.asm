
include macros80.inc

; {DE <r<r 1}
@crdel: mov     a,e
        ral
        mov     e,a
        mov     a,d
        ral
        mov     d,a
        ora     e
        ret

public	@crdel

endall
