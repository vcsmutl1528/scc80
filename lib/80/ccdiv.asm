
include macros80.inc

extrn	@cdeneg
extrn	@cbcneg
extrn	@crdel
extrn	@ccmpbd
; HL = DE / HL, DE = DE % HL
@cdiv:  mov     b,h
        mov     c,l
        mov     a,d
        xra     b
        push    psw
        mov     a,d
        ora     a
        cm      @cdeneg
        mov     a,b
        ora     a
        cm      @cbcneg
        mvi     a,16
        push    psw
        xchg
        lxi     d,0
ccdiv1: dad     h
        call    @crdel
        jz      ccdiv2
        call    @ccmpbd
        jm      ccdiv2
        mov     a,l
        ori     1
        mov     l,a
        mov     a,e
        sub     c
        mov     e,a
        mov     a,d
        sbb     b
        mov     d,a
ccdiv2: pop     psw
        dcr     a
        jz      ccdiv3
        push    psw
        jmp     ccdiv1
ccdiv3: pop     psw
        rp
        call    @cdeneg
        xchg
        call    @cdeneg
        xchg
        ret

public	@cdiv

endall
