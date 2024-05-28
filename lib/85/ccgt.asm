
include macros80.inc

extrn	@ccmp
; DE > HL [signed]
@cgt:   xchg
        call    @ccmp
        rc
        dcx     h
        ret

public	@cgt

endall
