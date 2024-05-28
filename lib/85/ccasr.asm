
include macros80.inc

; shift DE right arithmetically by HL, move to HL - 8085 undocumented instructions
@casr:	xchg
ccasr1: dcr     e
        rm
;        arhl
        DB	10h
        jmp     ccasr1

public	@casr

endall
