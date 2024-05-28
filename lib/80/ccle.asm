
include macros80.inc

extrn	@ccmp
; DE <= HL [signed]
@cle:   call    @ccmp
        rz
        rc
        dcx     h
        ret

public	@cle

endall
