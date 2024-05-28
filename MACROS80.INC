; MACROS80.INC
%PUSHLCTL
%NOLIST
NOWARN RES
; 11-24-91
; Placed in the public domain by Clarence Wilkerson
; anyone can do anything they want with this, at their own risk

; this is a collection of macros to assemble 8080 assembler code
; with the TASM Turbo Assembler on a PC.
; Most of it will probably work with MASM also.
; This is a quick hack. There is basically no error checking
; on register operands.
; Advantages: Fast assembly ( 25 seconds on 16mhz 386sx for a 70k bios source
;  file, cheap enough if you have TASM already
; Disadvantages: Not portable, error checking, listing is messy, style
;  of macro definitions eats up name space
; Question: On TASM is there a patch to kill internal tables for defining
;  opcodes, registers, etc?
;
;  Typical usage
;  USAGE:
;      tasm /mu /l file[.asm] <----- file.asm has include macros80.asm
;      tlink  file
;      exe2bin file.exe file.com
;  BUGS:  1) The file has an extra 0100H of nulls at beginning
;            if ORG 0100H is used. If it is not used
;            addresses don't come out right.
;         2) The conditional assembly instructions for TASM
;	     don't seem to parse expressions the same way as MAC
;            so check these carefully if code length comes out wrong
;         3) Two things don't work as usual:
;            DS directive is replaced  by DSS  
;            END directive is replaced by ENDALL
;         4) I made no attempt to teach it the ! notation for continuation of
;             line
;         5) Doesn't always get all of an expression... stops at spaces
;
;  NOTE: I haven't tried this with the DR Z80.LIB z80 macros
;
PURGE  SUB, CPO, MOV, CALL, JMP, EI, DI, RET

 a	equ 7
 b 	equ 0
 c 	equ 1
 d 	equ 2
 e 	equ 3
 h 	equ 4
 l 	equ 5
 m 	equ 6
 sp 	equ  6
 ps 	equ  6
 psw 	equ  6
REGMASK    equ 07h   ; A,B,C,D,H,L,M
REGPMASK   equ 06h   ; B, D, H, PSW, SP since names overlap, scale by *2
REGPSHIFT  equ  3    ; and with 00000110B and then shl 3
REGSHIFT   equ  3    ; only used for mov, mvi, inr, dcr
RSTSHIFT   equ  3    ; screwy indexing for RST instruction
RSTMASK    equ  3    ;
; make the code come out on one line for opcode, address pairs
regaddr struc
        RR  db ?
        AA  dw ?
ends

dss    macro  x
       IFE   x
       ; zero length fill
       ELSE
	db    (offset x)  dup(?)
       ENDIF	
endm

aci    macro  x8
	db    0ceh,LOW x8
endm

adi     macro  x8
	db    0c6h,LOW x8
endm

adc     macro  reg
	db    088h OR (reg AND REGMASK)
endm

add     macro  reg
        db    080h or (reg and REGMASK)
endm

ana     macro  reg
	db    0a0h OR (reg AND REGMASK)
endm

ani      macro x8
	db     0e6h,LOW x8
endm

call    macro   addr
	regaddr < 0cdh, offset addr>
endm

cc 	macro  addr
	regaddr  <0dch,offset addr>
endm
cm	macro  addr
	regaddr   <0fch, offset addr>
endm
cma	macro
	db	02fh
endm
cmc	macro
	db	03fh
endm
cmp	macro	reg
	db	0b8h OR (reg AND REGMASK)
endm
cnc	macro	addr
	regaddr   <0d4h, offset addr>
endm
cnz	macro	addr
	regaddr   <0c4h, offset addr>
endm
cp	macro	addr
	regaddr   <0f4h, offset addr>
endm
cpe	macro	addr
	regaddr   <0ech, offset addr>
endm
cpi	macro   x8
	db	0feh,LOW x8
endm
cpo	macro	addr
	regaddr   <0e4h, offset addr>
endm
cz	macro    addr
	regaddr   <0cch, offset addr>
endm
daa	macro
	db	027h
endm
dad	macro	regpr
	IFDIF   <regpr>,<SP>
	db	009h OR ((regpr and REGPMASK) SHL REGPSHIFT)
	ELSE
	db	009h OR (( 6 and REGPMASK) SHL REGPSHIFT)
	ENDIF
endm
dcr	macro	reg
	db	005h OR ((reg AND REGMASK) shl REGSHIFT)
endm
dcx     macro   regpr
	IFDIF   <regpr>,<SP>
	db	00bh OR ((regpr and REGPMASK) SHL REGPSHIFT)
	ELSE
	db	00bh OR (( 6 and REGPMASK) SHL REGPSHIFT)
	ENDIF
endm
di	macro
	db	0f3h
endm
ei	macro
	db	0fbh
endm
hlt	macro
	db	076h
endm
in	macro   x8
	db	0dbh, LOW x8
endm
inr	macro	reg
	db	004h OR ((reg AND REGMASK) SHL 3)
endm
inx	macro	regpr
	IFDIF   <regpr>,<SP>
	db	03h OR ((regpr and REGPMASK) SHL REGPSHIFT)
	ELSE
	db	03h OR (( 6 and REGPMASK) SHL REGPSHIFT)
	ENDIF
endm
jc	macro	addr
	regaddr   <0dah, offset addr>
endm
jm	macro	addr
	regaddr   <0fah, offset addr>
endm
jmp	macro	addr
	regaddr   <0c3h, offset addr>
endm
jnc	macro	addr
	regaddr   <0d2h, offset addr>
endm
jnz	macro	addr
	regaddr   <0c2h, offset addr>
endm
jp	macro	addr
	regaddr   <0f2h, offset addr>
endm
jpe	macro	addr
	regaddr   <0eah, offset addr>
endm
jpo	macro	addr
	regaddr   <0e2h, offset addr>
endm
jz	macro	addr
	regaddr   <0cah, offset addr>
endm
lda	macro   addr
	regaddr   <03ah, offset addr>
endm
ldax	macro	regpr
	db	00ah OR ((regpr and REGPMASK) SHL REGPSHIFT)
endm
lhld	macro	addr
	regaddr   <02ah, offset addr>
	endm
lxi	macro	regpr,addr
	IFDIF   <regpr>,<SP>
	regaddr	<001h OR ((regpr and REGPMASK) SHL REGPSHIFT),offset addr>
	ELSE
	regaddr <001h OR (( 6 and REGPMASK) SHL REGPSHIFT),offset addr>
	ENDIF
endm
mov	macro	regD,regS
	db	(040h OR (regS and REGMASK)) OR ((regD and REGMASK) SHL REGSHIFT )
endm
mvi	macro   regD,x8
	db	(006h) OR ((regD and REGMASK) SHL REGSHIFT) , LOW x8
endm
nop	macro
	db	00h
endm
ora	macro	reg
	db	0b0h OR ( reg and REGMASK)
endm
ori	macro	x8
	db	0f6h, LOW x8
endm
out	macro	x8
	db	0d3h, LOW x8
endm
pchl	macro
	db	0e9h
	endm
pop	macro	regpr
	db	0c1h OR ((regpr and REGPMASK) SHL REGPSHIFT)
endm

push	macro	regpr
	db	0c5h OR ((regpr and REGPMASK) SHL REGPSHIFT)
endm
; below this point macros are filled in correctly
ral	macro
	db	017h
endm

rar	macro
	db	01fh
endm

rc	macro
	db	0d8h
endm

ret	macro
	db	0C9h
endm

rlc	macro
	db	07h
endm

rm	macro
	db	0f8h
endm

rnc     macro
	db	0d0h
endm
rnz     macro
	db	0c0h
endm

rp     macro
	db	0f0h
endm

rpe    macro
	db	0e8h
endm

rpo   macro
	db	0e0h
endm

rrc   macro
	db	0fh
endm

rst	macro	x8      ; range of 0 .. 7
	db      0c7h OR ((x8 AND 7) SHL 3)
endm

rz      macro
	db 0c8h
endm

sbb	macro	reg
	db	098h  OR ( reg and REGMASK)
endm

sbi	macro   x8
	db	0deh, LOW x8
endm

shld    macro   addr
	regaddr   <022h, offset addr>
endm
sphl    macro
	db	0f9h
endm

sta	macro	addr
	regaddr   <032h, offset addr>
endm

stax	macro	regpr
	db	02h OR ((regpr and REGPMASK) SHL REGPSHIFT)
endm

stc     macro
	db	037h
endm


sub     macro   reg
	db	090h or (reg and REGMASK)
endm

sui     macro   x8
	db	0d6h,LOW x8
endm

xchg    macro
	db	0ebh
endm

xra	macro	reg
	db	0a8h  OR (reg and REGMASK)
endm

xri	macro	x8
	db	0eeh, LOW x8
endm


xthl    macro
	db	0e3h
endm
dsub	macro
	db	08h
endm
arhl	macro
	db	10h
endm
rdel	macro
	db	18h
endm
ldhi	macro	x8
	db	28h, LOW x8
endm
ldsi	macro	x8
	db	38h, LOW x8
endm
rstv	macro
	db	0cbh
endm
shlx	macro	addr
	db	0d9h
endm
lhlx	macro	addr
	db	0edh
endm
jnx5	macro	addr
	regaddr   <0ddh, offset addr>
endm
jx5	macro	addr
	regaddr   <0fdh, offset addr>
endm
endall macro
;  code8080  ends
  end
endm
;stack80	segment stack
;stack80 ends
;code8080  segment byte
;assume  cs:code8080, ds:code8080, ss:code8080
.model	tiny
.code
%POPLCTL

