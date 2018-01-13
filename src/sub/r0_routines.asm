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
	
	
	
	
