
include macros80.inc

; fetch char from (HL) and sign extend into HL
@cgchar: mov     a,m
@csxt:  mov     l,a
        rlc
        sbb     a
        mov     h,a
        ret

public	@cgchar
public	@csxt

endall
