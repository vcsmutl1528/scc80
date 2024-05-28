
include macros80.inc

; fetch char from (HL) into HL no sign extend 
@guchar: mov     l,m
        mvi     h,0
        ret

public	@guchar

endall
