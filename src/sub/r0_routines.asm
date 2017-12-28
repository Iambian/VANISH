.ASSUME ADL=0

r0rc_ret_stack_entry .EQU -8
r0rc_ret_handler     .EQU -6

r0_bjumper:
	PUSH.L AF
	PUSH HL
	PUSH DE
	PUSH IX
	PUSH HL
		LD HL,__BJUMP_RET_ROUTINE
		JR r0_romcaller_breakin

r0_romcaller: ;-8
	PUSH.L AF ;   Not counted since not stored on SPS
	PUSH HL   ;-6 Contains return address to romcall return handler
	PUSH DE   ;-4
	PUSH IX   ;-2
	PUSH HL   ;+0
 		LD HL,__ROMCALL_RET_ROUTINE
r0_romcaller_breakin:
		LD IX,0
		ADD IX,SP
		LD (IX+r0rc_ret_handler),HL
		LD HL,(IX+r0rc_ret_stack_entry)
		LD DE,(HL)
		INC HL
		INC HL
		LD (IX+r0rc_ret_stack_entry),HL
		LD A,D
		ADD A,A
		JR C,r0_romcaller_callboot
		JP M,r0_romcaller_callos
		LD HL,$4000
		JR r0_romcaller_collect
r0_romcaller_callboot:
		LD HL,bcall_sbase_boot-$000018
		JR r0_romcaller_collect
r0_romcaller_callos:
		LD HL,bcall_sbase_os
r0_romcaller_collect:
		ADD HL,DE
		LD DE,(HL)
		INC HL
		INC HL
		LD (__ROMCALL_SHORT_JUMP_SMC),DE
		LD A,I
		DI
		LD A,(HL)
	POP HL
	POP IX
	POP DE
	JP.L +_
.ASSUME ADL=1
_:	LD MB,A
	JP.S __ROMCALL_SHORT_JUMP
.ASSUME ADL=0

	





r0_bootxora:
	XOR A
donothing:
	RET

