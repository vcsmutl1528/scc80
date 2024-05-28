
include macros80.inc

; case jump
@ccase: xchg                    ;switch value to DE. exchange HL with DE
        pop     h               ;get table address
cccase1: call    cccase4          ;get case value
        mov     a,e
        cmp     c               ;equal to switch value cc
        jnz     cccase2          ;no
        mov     a,d
        cmp     b               ;equal to switch value cc
        jnz     cccase2          ;no
        call    cccase4          ;get case label
        jz      cccase3          ;end of table, go to default
        push    b
        ret                     ;case jump
cccase2: call    cccase4          ;get case label
        jnz     cccase1          ;next case
cccase3: dcx     h
        dcx     h
        dcx     h               ;position HL to the default label
        mov     d,m             ;read where it points to
        dcx     h
        mov     e,m
        xchg                    ;exchange HL with DE and vice versa - address is now in HL
        pchl                    ;default jump. loads HL to PC
cccase4: mov     c,m
        inx     h
        mov     b,m
        inx     h
        mov     a,c
        ora     b
        ret

public	@ccase

endall
