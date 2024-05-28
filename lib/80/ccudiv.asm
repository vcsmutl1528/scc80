
include macros80.inc

; unsigned divide DE by HL and return quotient in HL, remainder in DE
; HL = DE / HL, DE = DE % HL
@cudiv: mov     b,h             ; store divisor to bc 
        mov     c,l
        lxi     h,0             ; clear remainder
        xra     a               ; clear carry        
        mvi     a,17            ; load loop counter
        push    psw
ccduv1: mov     a,e             ; left shift dividend into carry 
        ral
        mov     e,a
        mov     a,d
        ral
        mov     d,a
        jc      ccduv2          ; we have to keep carry -> calling else branch
        pop     psw             ; decrement loop counter
        dcr     a
        jz      ccduv5
        push    psw
        xra     a               ; clear carry
        jmp     ccduv3
ccduv2: pop     psw             ; decrement loop counter
        dcr     a
        jz      ccduv5
        push    psw
        stc                     ; set carry
ccduv3: mov     a,l             ; left shift carry into remainder 
        ral
        mov     l,a
        mov     a,h
        ral
        mov     h,a
        mov     a,l             ; substract divisor from remainder
        sub     c
        mov     l,a
        mov     a,h
        sbb     b
        mov     h,a
        jnc     ccduv4          ; if result negative, add back divisor, clear carry
        mov     a,l             ; add back divisor
        add     c
        mov     l,a
        mov     a,h
        adc     b
        mov     h,a     
        xra     a               ; clear carry
        jmp     ccduv1
ccduv4: stc                     ; set carry
        jmp     ccduv1
ccduv5: xchg
        ret 

public	@cudiv

endall
