
include macros80.inc

; shift DE left arithmetically by HL, move to HL
@casl:  xchg
ccasl1: dcr     e
        rm
        dad     h
        jmp     ccasl1

public	@casl

endall
