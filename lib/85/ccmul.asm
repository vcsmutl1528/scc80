
include macros80.inc

; HL = DE * HL [signed]
@cmul:  mov     b,h
        mov     c,l
        lxi     h,0
ccmul1: mov     a,c
        rrc
        jnc     ccmul2
        dad     d
ccmul2: xra     a
        mov     a,b
        rar
        mov     b,a
        mov     a,c
        rar
        mov     c,a
        ora     b
        rz
        xra     a
        mov     a,e
        ral
        mov     e,a
        mov     a,d
        ral
        mov     d,a
        ora     e
        rz
        jmp     ccmul1

public	@cmul

endall
