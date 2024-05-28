
include macros80.inc

; shift DE right logically by HL, move to HL
@clsr:  xchg
cclsr1: dcr     e
        rm
        stc
        cmc
        mov     a,h
        rar
        mov     h,a
        mov     a,l
        rar
        mov     l,a
        jmp     cclsr1

public	@clsr

endall
