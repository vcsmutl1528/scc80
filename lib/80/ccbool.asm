
include macros80.inc

extrn	@clneg
; HL = !!HL
@cbool: call    @clneg
        jmp     @clneg

public	@cbool

endall
