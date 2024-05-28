
include macros80.inc

extrn	@cucmp
; DE >= HL [unsigned]
@cuge:  call    @cucmp
        rnc
        dcx     h
        ret

public	@cuge

endall
