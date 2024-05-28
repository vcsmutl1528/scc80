
include macros80.inc

extrn	@ccmp
;......logical operations: HL set to 0 (false) or 1 (true)
;
; DE == HL
@ceq:   call    @ccmp
        rz
        dcx     h
        ret

public	@ceq

endall
