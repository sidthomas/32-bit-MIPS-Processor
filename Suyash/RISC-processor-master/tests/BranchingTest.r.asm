; This test is modified version of original content provided 
; under CC-by-NC-SA license by MIT OCW.


; Branching tests

. = 0

; here on reset

	BEQ %R31,Start,XP		; should branch
error1 = .

; here on illegal instructions or if BEQ above didn't work

	BR IllInst

; here on interrupts

	JMP XP			; return from interrupt  don't adjust XP!

; here when we've found an error

Error:
	ADDC %R0,0,%R31			; put error code on result bus
	BR Error			; loop  or least try to!

; handler for illegal instructions
IllInst:
	CMPEQC XP,error1,%R0		; did the first instruction fail?
	BF %R0,Ill_1			; nope, do regular processing
	MOVE XP,%R0			; yup, branch to error handler
	BR Error

Ill_1:	ADDC %R1,1,%R1			; update count
	JMP XP				; return to user...

; okay, now for some real tests...
Start:
	BNE %R31,Error,%R0		; shouldn't branch
erro%r3 = .

	; test simple comparisons
	CMPEQC %R31,0,%R0
	BF %R0,Error,%R0
cmp1 = .
	CMPLEC %R31,0,%R0
	BF %R0,Error,%R0
cmp2 = .
	CMPLTC %R31,1,%R0
	BF %R0,Error,%R0
cmp3 = .
	CMPEQC %R31,-1,%R0
	BT %R0,Error,%R0
cmp4 = .
	CMPLEC %R31,-1,%R0
	BT %R0,Error,%R0
cmp5 = .
	CMPLTC %R31,-1,%R0
	BT %R0,Error,%R0
cmp6 = .

	; test comparisons with overflow
	ADDC %R31,1,%R1			; load 0x8000000 into %r0
	SHLC %R1,31,%R1
	SUBC %R1,1,%R2			; load 0x7FFFFFF into %r1
	OR %R1,%R2,%R3			; make sure we have what we think we have
	CMPEQC %R3,-1,%R3
	BF %R3,Error,%R0
cmp7 = .
	CMPLE %R1,%R2,%R3			; subtraction should overflow
	BF %R3,Error,%R0			; shouldn't branch
cmp8 = .
	CMPLE %R2,%R1,%R3			; test it the other way too
	BT %R3,Error,%R0
cmp9 = .


	; test the registers
	ADD %R31,%R31,%R0			; start by making sure ADD works
	BNE %R0,Error,%R0		; shouldn't branch
reg1 = .

	ADDC %R31,0,%R0			; and then ADDC
	BNE %R0,Error,%R0		; shouldn't branch
reg2 = .

	ADDC %R31,0,%R0			; now fill all regs with unique values
	ADDC %R31,1,%R1
	ADDC %R31,2,%R2
	ADDC %R31,3,%R3
	ADDC %R31,4,%R4
	ADDC %R31,5,%R5
	ADDC %R31,6,%R6
	ADDC %R31,7,%R7
	ADDC %R31,8,%R8
	ADDC %R31,9,%R9
	ADDC %R31,10,%R10
	ADDC %R31,11,%R11
	ADDC %R31,12,%R12
	ADDC %R31,13,%R13
	ADDC %R31,14,%R14
	ADDC %R31,15,%R15
	ADDC %R31,16,%R16
	ADDC %R31,17,%R17
	ADDC %R31,18,%R18
	ADDC %R31,19,%R19
	ADDC %R31,20,%R20
	ADDC %R31,21,%R21
	ADDC %R31,22,%R22
	ADDC %R31,23,%R23
	ADDC %R31,24,%R24
	ADDC %R31,25,%R25
	ADDC %R31,26,%R26
	ADDC %R31,27,%R27
	ADDC %R31,28,%R28
	ADDC %R31,29,%R29
	ADDC %R31,30,%R30
	ADDC %R31,31,%R31

	CMPEQC %R0,0,%R0			; now check all the reg values
	BF %R0,Error,%R0
reg3 = .
	CMPEQC %R1,1,%R0
	BF %R0,Error,%R0
reg4 = .
	CMPEQC %R2,2,%R0
	BF %R0,Error,%R0
reg5 = .
	CMPEQC %R3,3,%R0
	BF %R0,Error,%R0
reg6 = .
	CMPEQC %R4,4,%R0
	BF %R0,Error,%R0
reg7 = .
	CMPEQC %R5,5,%R0
	BF %R0,Error,%R0
reg8 = .
	CMPEQC %R6,6,%R0
	BF %R0,Error,%R0
reg9 = .
	CMPEQC %R7,7,%R0
	BF %R0,Error,%R0
reg10 = .
	CMPEQC %R8,8,%R0
	BF %R0,Error,%R0
reg11 = .
	CMPEQC %R9,9,%R0
	BF %R0,Error,%R0
reg12 = .
	CMPEQC %R10,10,%R0
	BF %R0,Error,%R0
reg13 = .
	CMPEQC %R11,11,%R0
	BF %R0,Error,%R0
reg14 = .
	CMPEQC %R12,12,%R0
	BF %R0,Error,%R0
reg15 = .
	CMPEQC %R13,13,%R0
	BF %R0,Error,%R0
reg16 = .
	CMPEQC %R14,14,%R0
	BF %R0,Error,%R0
reg17 = .
	CMPEQC %R15,15,%R0
	BF %R0,Error,%R0
reg18 = .
	CMPEQC %R16,16,%R0
	BF %R0,Error,%R0
reg19 = .
	CMPEQC %R17,17,%R0
	BF %R0,Error,%R0
reg20 = .
	CMPEQC %R18,18,%R0
	BF %R0,Error,%R0
reg21 = .
	CMPEQC %R19,19,%R0
	BF %R0,Error,%R0
reg22 = .
	CMPEQC %R20,20,%R0
	BF %R0,Error,%R0
reg23 = .
	CMPEQC %R21,21,%R0
	BF %R0,Error,%R0
reg24 = .
	CMPEQC %R22,22,%R0
	BF %R0,Error,%R0
reg25 = .
	CMPEQC %R23,23,%R0
	BF %R0,Error,%R0
reg26 = .
	CMPEQC %R24,24,%R0
	BF %R0,Error,%R0
reg27 = .
	CMPEQC %R25,25,%R0
	BF %R0,Error,%R0
reg28 = .
	CMPEQC %R26,26,%R0
	BF %R0,Error,%R0
reg29 = .
	CMPEQC %R27,27,%R0
	BF %R0,Error,%R0
reg30 = .
	CMPEQC %R28,28,%R0
	BF %R0,Error,%R0
reg31 = .
	CMPEQC %R29,29,%R0
	BF %R0,Error,%R0
reg32 = .
	CMPEQC %R30,30,%R0
	BF %R0,Error,%R0
reg33 = .
	BNE %R31,Error,%R0
reg34 = .

; check out JMPs

	CMOVE jmp1,%R17
	SHLC %R1,31,%R1
	OR %R1,%R17,%R17
	JMP %R17,LP
	BEQ %R31,Error,%R0	; shouldn't execute this!
jmp1 = .
	SHLC LP,1,LP		; get rid of kernel-mode bit
	SHRC LP,1,LP
	CMPEQC LP,jmp1-4,%R23	; see if LP was filled correctly
	BEQ %R23,Error,%R0
jmp2 = .

; check out LDR/ADD/SUB

	LDR CA,%R24
	LDR C5,%R25
	ADD %R24,%R25,%R26	; 0xAAAAAAAA + 0x55555555 = -1
	CMPEQC %R26,-1,%R27
	BEQ %R27,Error,%R0
add1 = .
	ADD %R24,%R24,%R26	; 0xAAAAAAAA + 0xAAAAAAAA = 0x55555554
	SUB %R26,%R25,%R26
	CMPEQC %R26,-1,%R27
	BEQ %R27,Error,%R0
add2 = .
	ADD %R25,%R25,%R26	; 0x55555555 + 0x55555555 = 0xAAAAAAAA
	SUB %R26,%R24,%R26
	BNE %R26,Error,%R0
add3 = .
	CMOVE 1,%R17
	SUBC %R17,1,%R18		; test carry propagation
	BNE %R18,Error,%R0
add4 = .

; test boolean operations

	CMOVE 0x0F0F,%R11
	CMOVE 0x7F00,%R12
	AND %R11,%R12,%R13	; 0x0F0F & 0x7F00 = 0x0F00
	CMPEQC %R13,0x0F00,%R14
	BEQ %R14,Error,%R0
bool1 = .
	OR %R11,%R12,%R13		; 0x0F0F ; 0x7F00 = 0x7F0F
	CMPEQC %R13,0x7F0F,%R14
	BEQ %R14,Error,%R0
bool2 = .
	XOR %R11,%R12,%R13	; 0x0F0F ^ 0x7F00 = 0x700F
	CMPEQC %R13,0x700F,%R14
	BEQ %R14,Error,%R0
bool3 = .

; test shifts

	CMOVE 1,%R27
	SHLC %R27,32,%R28	; should do nothing
	CMPEQC %R28,1,%R29
	BEQ %R29,Error,%R0
shift1 = .
	SHLC %R27,31,%R28	; 1 << 31 = 0x80000000
	SRAC %R28,17,%R26	; 0x80000000 >> signed 17 = 0xFFFFC000
	CMPEQC %R26,0xC000,%R25
	BEQ %R25,Error,%R0
shift2 = .
	SHRC %R28,17,%R26	; 0x80000000 >> unsigned 17 = 0x00004000
	CMPEQC %R26,0x4000,%R25
	BEQ %R25,Error,%R0
shift3 = .

; test illegal operations

	CMOVE 0,XP
	CMOVE 0,%R1
	LONG 0x08 << 26	; illegal operation
	SHLC XP,1,XP		; get rid of kernel-mode bit
	SHRC XP,1,XP
	CMPEQC XP,.-8,%R0
	BEQ %R0,Error,%R0
illop1 = .
	LONG 0x1A << 26	; some more illegal operations
	LONG 0x1C << 26
	LONG 0x27 << 26
	LONG 0x2B << 26
	LONG 0x2F << 26
	LONG 0x37 << 26
	LONG 0x3B << 26
	LONG 0x3F << 26
	CMPEQC %R1,9,%R0
	BEQ %R0,Error,%R0
illop2 = .

; test load and store

	CMOVE LDST,%R4		; load base reg
	LDR CA,%R9
	XORC %R9,-1,%R0		; %R0 <- 0x55555555
	ST %R0,0,%R4		; try some stores
	ST %R0,LDST+4,%R31	; check out bypassing  if any!
	ST %R0,8,%R4
	ST %R0,LDST+12,%R31
	LD %R4,0,%R6
	LDR C5,%R5
	CMPEQ %R6,%R5,%R0		; check 1-stage stall
	BEQ %R0,Error,%R0
ldst1 = .
	LD %R31,LDST+4,%R7
	CMPEQ %R7,%R5,%R0		; check 2-stage stall
	BEQ %R0,Error,%R0
ldst2 = .
	LD %R4,8,%R8
	CMPEQ %R8,%R5,%R0
	BEQ %R0,Error,%R0
ldst3 = .
	LD %R31,LDST+12,%R9
	CMPEQ %R9,%R5,%R0
	BEQ %R0,Error,%R0
ldst4 = .

; finally, check out some bypass paths  just in case...

	ADD %R31,%R20,%R0		; %R20 = 20
	ADD %R0,%R0,%R1		; bypass from ALU stage
	ADD %R0,%R0,%R2		; bypass from MEM stage
	ADD %R0,%R0,%R3		; bypass from WB stage
	ADD %R0,%R0,%R4		; read from register
	ADD %R1,%R2,%R5
	ADD %R3,%R5,%R5
	ADD %R4,%R5,%R5
	CMPEQC %R5,160,%R0
	BEQ %R0,Error,%R0
bypass1 = .

	BNE %R31,.+4,%R0		; %R0 = bypass
bypass:	ADD %R0,%R0,%R1		; bypass PC from ALU stage
	ADD %R0,%R0,%R2		; bypass PC from MEM stage
	ADD %R0,%R0,%R3		; bypass PC from WB stage
	ADD %R0,%R0,%R4		; read from register
	ADD %R1,%R2,%R5
	ADD %R3,%R5,%R5
	ADD %R4,%R5,%R5
	CMPEQC %R5,8*bypass,%R0
	BEQ %R0,Error,%R0
bypass1 = .

; check interrupts
	CMOVE .+8,%R0
	JMP %R0			; leave supervisor mode
	BEQ %R31,Error,%R0	; this should be interrupted
int1 = .
	CMPEQC XP,.,%R0		; see if XP has correct value
	BF %R0,Error,%R0
int2 = .

; all done!

Done:	ADDC %R31,0,%R31
	BR Done

CA:	LONG 0xAAAAAAAA
C5:	LONG 0x55555555
LDST:	LONG 0
	LONG 0
	LONG 0
	LONG 0

