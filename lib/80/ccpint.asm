
include macros80.inc

; store int from HL into (DE)
@cpint: mov     a,l
        stax    d
        inx     d
        mov     a,h
        stax    d
        ret 

public	@cpint

endall
