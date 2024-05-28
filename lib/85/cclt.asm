
include macros80.inc

extrn	@ccmp
; DE < HL [signed]
@clt:   call    @ccmp
        rc
        dcx     h
        ret

public	@clt

endall
