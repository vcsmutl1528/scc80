
include macros80.inc

extrn	@ccmp
; DE != HL
@cne:   call    @ccmp
        rnz
        dcx     h
        ret

public	@cne

endall
