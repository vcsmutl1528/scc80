
include macros80.inc

extrn	@cucmp
; DE < HL [unsigned]
@cult:  call    @cucmp
        rc
        dcx     h
        ret

public	@cult

endall
