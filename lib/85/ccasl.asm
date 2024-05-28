
include macros80.inc

@casl:  xchg
ccasl1: dcr     e
        rm
        dad     h
        jmp     ccasl1

public	@casl

endall
