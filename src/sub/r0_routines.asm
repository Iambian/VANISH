.ASSUME ADL=0

r0rc_ret_stack_entry .EQU -8
r0rc_ret_handler     .EQU -6

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
	LD HL,bcall_sbase_boot-$000018
	JR r0rc_coll
r0rc_os:
	LD HL,bcall_sbase_os
r0rc_coll:
	ADD HL,DE
	LD DE,(HL)
	LD (r0rc_csmc),DE
	LD A,I  ;MAINTAIN INTERRUPT STATE AFTER EXIT
	DI
	PUSH AF  ;PUSH TO SPL
	POP.S DE \	POP.S HL \	POP.S AF
r0rc_csmc .EQU $+1
	CALL 0
	PUSH.S AF
	POP AF
	JP PO,+_
	EI
_:	JP.SIS (+_)&$FFFF
.ASSUME ADL=0
_:	POP AF
	RET
	
	
	
	
	
	
	
	





r0_bootxora:
	XOR A
donothing:
	RET

