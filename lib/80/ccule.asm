
include macros80.inc

extrn	@cucmp
; DE <= HL [unsigned]
@cule:  call    @cucmp
        rz
        rc
        dcx     h
        ret

public	@cule

endall
