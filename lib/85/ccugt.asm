
include macros80.inc

extrn	@cucmp
; DE > HL [unsigned]
@cugt:  xchg
        call    @cucmp
        rc
        dcx     h
        ret

public	@cugt

endall
