
include macros80.inc

extrn	@ccmp
; DE >= HL [signed]
@cge:   call    @ccmp
        rnc
        dcx     h
        ret

public	@cge

endall
