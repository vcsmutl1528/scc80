
include macros80.inc

extrn	@ccom
; HL = -HL
@cneg:  call    @ccom
        inx     h
        ret

public	@cneg

endall
