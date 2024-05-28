
include macros80.inc

; store char from HL into (DE)
@cpchar: mov     a,l
        stax    d
        ret

public	@cpchar

endall
