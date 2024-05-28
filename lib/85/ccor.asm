
include macros80.inc

; "or" HL and DE into HL
@cor:   mov     a,l
        ora     e
        mov     l,a
        mov     a,h
        ora     d
        mov     h,a
        ret

public	@cor

endall
