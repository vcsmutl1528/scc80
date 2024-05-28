
include macros80.inc

; "and" HL and DE into HL
@cand:  mov     a,l
        ana     e
        mov     l,a
        mov     a,h
        ana     d
        mov     h,a
        ret

public	@cand

endall
