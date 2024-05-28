
include macros80.inc

; shift DE right arithmetically by HL, move to HL
@casr:  xchg
ccasr1: dcr     e
        rm
        mov     a,h
        ral
        mov     a,h
        rar
        mov     h,a
        mov     a,l
        rar
        mov     l,a
        jmp     ccasr1

public	@casr

endall
