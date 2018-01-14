.ASSUME ADL=0

r0rc_ret_stack_entry .EQU 6
;r0rc_ret_handler     .EQU 4

r0_romcaller: ;-8
	PUSH AF \ PUSH HL \ PUSH DE
	LD HL,r0rc_ret_stack_entry
	ADD HL,SP
	LD DE,(HL)  ;FETCH RETURN ADDRESS FROM STACK
	LD A,(DE)   ;READ DATA 1 BYTE AT RETURN ADDRESS
	INC DE
	INC DE
	LD (HL),DE  ;SKIP OVER DATA BYTES AND PUSH BACK RETURN ADDRESS TO STACK
	EX DE,HL    ;POINTER TO RETURN ADDRESS IN HL
	DEC HL      ;BACKTRACK TO DATA 2 BYTE
	LD D,(HL)
	LD E,A      ;COMPLETE DATA 1,2 IN DE
	LD (r0syscalldata&$FFFF),DE ;FOR DEBUGGING/ERROR REPORTING PURPOSES
	PUSH BC
		CALL suspendWdt&$FFFF
	POP BC
	LD A,I  ;MAINTAIN INTERRUPT STATE AFTER EXIT
	LD A,$C9  ;RET OPCODE
	JP PO,_&$FFFF
	LD A,$FB  ;EI OPCODE
_:	LD (r0interruptenablesmc&$FFFF),A
	DI
	JP.LIL +_
.ASSUME ADL=1
_:	LD A,D
	ADD A,A
	JR C,r0rc_boot
	JP M,r0rc_os
r0rc_app:
	LD HL,$004000  ;PLACEHOLDER FOR WHEN SUPPORT IS ADDED
	JR r0rc_coll
r0rc_boot:
	LD HL,bcall_sbase_boot-$008018
	JR r0rc_coll
r0rc_os:
	LD HL,bcall_sbase_os-$004000
r0rc_coll:
	ADD HL,DE
	LD DE,(HL)
	PUSH DE \ INC SP \ POP AF \ DEC SP
	CP A,($>>16)&$FF  ;if called routine is on same page as this, call in z80 mode
	JP.SIS Z,r0rc_samepage&$FFFF
	LD (r0rc_csmc),DE
	POP.S DE \	POP.S HL \	POP.S AF
r0rc_csmc .EQU $+1
	CALL 0
	JP.SIS r0rc_continuez80mode&$FFFF
.ASSUME ADL=0
r0rc_continuez80mode:
	PUSH AF
		PUSH BC
			PUSH HL
				CALL restartWdt&$FFFF
			POP HL
		POP BC
	POP AF
r0interruptenablesmc .EQU $+0
	RET
	RET
r0syscalldata:
.dw 0
r0rc_samepage:
	LD ((_+1)&$FFFF),DE	
	POP DE \ POP HL \ POP AF
_:	CALL 0
	JR r0rc_continuez80mode

r0_bootxora:
	XOR A
donothing:
	RET
LdHLInd:
	LD HL,(HL)
	LD A,L ;MIMIC LEGACY BEHAVIOR
	RET
CpHLDE:
	PUSH HL
		OR A
		SBC HL,DE
	POP HL
	RET
	
;5856
	
#define opxy(x,y) .db y*11,x*11
Op1ToOp2: CALL OpXtoOpY&$FFFF \ opxy(1,2) ;1
Op1ToOp3: CALL OpXtoOpY&$FFFF \ opxy(1,3)
Op1ToOp4: CALL OpXtoOpY&$FFFF \ opxy(1,4)
Op1ToOp5: CALL OpXtoOpY&$FFFF \ opxy(1,5)
Op1ToOp6: CALL OpXtoOpY&$FFFF \ opxy(1,6)
Op2ToOp1: CALL OpXtoOpY&$FFFF \ opxy(2,1) ;2
Op2ToOp3: CALL OpXtoOpY&$FFFF \ opxy(2,3)
Op2ToOp4: CALL OpXtoOpY&$FFFF \ opxy(2,4)
Op2ToOp5: CALL OpXtoOpY&$FFFF \ opxy(2,5)
Op2ToOp6: CALL OpXtoOpY&$FFFF \ opxy(2,6)
Op3ToOp1: CALL OpXtoOpY&$FFFF \ opxy(3,1) ;3
Op3ToOp2: CALL OpXtoOpY&$FFFF \ opxy(3,2)
Op3ToOp4: CALL OpXtoOpY&$FFFF \ opxy(3,4)
Op3ToOp5: CALL OpXtoOpY&$FFFF \ opxy(3,5)
Op4ToOp1: CALL OpXtoOpY&$FFFF \ opxy(4,1) ;4
Op4ToOp2: CALL OpXtoOpY&$FFFF \ opxy(4,2)
Op4ToOp3: CALL OpXtoOpY&$FFFF \ opxy(4,3)
Op4ToOp5: CALL OpXtoOpY&$FFFF \ opxy(4,5)
Op4ToOp6: CALL OpXtoOpY&$FFFF \ opxy(4,6)
Op5ToOp1: CALL OpXtoOpY&$FFFF \ opxy(5,1) ;5
Op5ToOp2: CALL OpXtoOpY&$FFFF \ opxy(5,2)
Op5ToOp3: CALL OpXtoOpY&$FFFF \ opxy(5,3)
Op5ToOp4: CALL OpXtoOpY&$FFFF \ opxy(5,4)
Op5ToOp6: CALL OpXtoOpY&$FFFF \ opxy(5,6)
Op6ToOp1: CALL OpXtoOpY&$FFFF \ opxy(6,1) ;6
Op6ToOp2: CALL OpXtoOpY&$FFFF \ opxy(6,1)
Op6ToOp5: CALL OpXtoOpY&$FFFF \ opxy(6,5)
	
Op1ExOp2: CALL OpXExOpY&$FFFF \ opxy(1,2)
Op1ExOp3: CALL OpXExOpY&$FFFF \ opxy(1,3)
Op1ExOp4: CALL OpXExOpY&$FFFF \ opxy(1,4)
Op1ExOp5: CALL OpXExOpY&$FFFF \ opxy(1,5)
Op1ExOp6: CALL OpXExOpY&$FFFF \ opxy(1,6)
Op2ExOp4: CALL OpXExOpY&$FFFF \ opxy(2,4)
Op2ExOp5: CALL OpXExOpY&$FFFF \ opxy(2,5)
Op2ExOp6: CALL OpXExOpY&$FFFF \ opxy(2,6)
Op5ExOp6: CALL OpXExOpY&$FFFF \ opxy(5,6)

Exch9:
	LD B,9
ExLp:
	JR OpXExOpY_loop

OpXExOpY:
	POP HL
	LD E,(HL)
	INC HL
	LD L,(HL)
	LD D,(Op1>>8)&$FF  ;note: OP regs do not cross high byte bounds
	LD H,D
	LD B,11
OpXExOpY_loop:
	LD A,(DE)
	LD C,(HL)
	EX DE,HL
	LD (DE),A
	LD (HL),C
	INC HL
	INC DE
	DJNZ OpXExOpY_loop
	RET
	
OpXtoOpY:
	POP HL
	LD E,(HL)
	INC HL
	LD L,(HL)
	LD D,(Op1>>8)&$FF  ;note: OP regs do not cross high byte bounds
	LD H,D
Mov11B: LD C,11 \ JR _movX

Mov7B:  LD C,7  \ JR _movX
Mov8B:  LD C,8  \ JR _movX
Mov9B:  LD C,9  \ JR _movX
Mov10B: LD C,10 \ JR _movX
Mov18B: LD C,18 \ JR _movX
_movX:
	LD B,0
_movxx:
	LDIR
	RET
	
MovFrOp1:
	LD HL,Op1&$FFFF
	JR Mov9B
Mov9ToOp1:
	LD DE,Op1&$FFFF
	JR Mov9B
Mov9Op1Op2:
	CALL Mov9ToOp1&$FFFF
Mov9ToOp2:
	LD DE,Op2&$FFFF
	JR Mov9B

ZeroOp3:
	LD HL,Op3&$FFFF
	JR ZeroOp
ZeroOp2:
	LD HL,Op2&$FFFF
	JR ZeroOp
ZeroOp1:
	LD HL,Op1&$FFFF
ZeroOp:
	LD A,11
_:	LD (HL),0
	DEC A
	JR NZ,-_
	RET

ClrLp:
	LD (HL),0
	INC HL
	DJNZ ClrLp
	RET
	
	

;6104
