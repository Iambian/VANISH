.ASSUME ADL=0
.ORG 0
#IFDEF rom0
	.BLOCK $00-$ ;rst 00h SYSTEM_RESET
		RET
	.BLOCK $08-$ ;rst 08h _Op1ToOp2
		RET
	.BLOCK $10-$ ;rst 10h _FindSym
		RET
	.BLOCK $18-$ ;rst 18h _PushRealO1
		RET
	.BLOCK $20-$ ;rst 20h _Mov9ToOp1
		RET
	.BLOCK $28-$ ;rst 28h BCALL_MACRO_ROUTINE
		JP bcall_routine
	.BLOCK $30-$ ;rst 30h _FPAdd
		RET
	.BLOCK $38-$ ;rst 38h INTERRUPT_SERVICE_ROUTINE
		JP $+3   ;user-configurable to overcome lack of IM2 on some 84+CE models
		JP base_interrupt
	.BLOCK $50-$ ;bjump
		RET
	.BLOCK $59-$ ;errhandler on
		RET
	.BLOCK $5C-$ ;errhandler off
		RET
	.BLOCK $66-$ ;NMI vector
		RETN
#ELSE
	.BLOCK $00-$ ;rst 00h
		CALL.L rom0_base_adr+$00
		RET
	.BLOCK $08-$ ;rst 08h
		CALL.L rom0_base_adr+$08
		RET
	.BLOCK $10-$ ;rst 10h
		CALL.L rom0_base_adr+$10
		RET
	.BLOCK $18-$ ;rst 18h
		CALL.L rom0_base_adr+$18
		RET
	.BLOCK $20-$ ;rst 20h
		CALL.L rom0_base_adr+$20
		RET
	.BLOCK $28-$ ;rst 28h
		JR $     ;NO. YOU CANNOT USE BCALL OUTSIDE rom0. NICE TRY.
	.BLOCK $30-$ ;rst 30h
		CALL.L rom0_base_adr+$30
		RET
	.BLOCK $38-$ ;rst 38h
		CALL.L rom0_base_adr+$38
		RET
	.BLOCK $50-$ ;bjump
		CALL.L rom0_base_adr+$50
		RET
	.BLOCK $59-$ ;errhandler on
		JR 
		CALL.L rom0_base_adr+$59
		RET
	.BLOCK $5C-$ ;errhandler off
		CALL.L rom0_base_adr+$5C
		RET
	.BLOCK $66-$ ;NMI vector
		RETN
#ENDIF

.BLOCK $70-$  ;FIXED ADDRESS.
__ROMCALL_RET_ROUTINE:
	PUSH AF
		LD A,I  ;INTERRUPT STATE IN P/V
		DI
		JP.L +_
.ASSUME ADL=1
_:		LD A,rom0_base_adr>>16
		LD MB,A
		JP.S +_
.ASSUME ADL=0
_:		JP PO,+_
		EI
_:	POP AF
	RET
;This only works because the emulation layer runs in RAM
__ROMCALL_SHORT_JUMP:
	JP PO,+_
	EI
_:	POP.L AF
__ROMCALL_SHORT_JUMP_SMC .EQU $+2
	JP.SIS $0000
__BJUMP_RET_ROUTINE:
	DI
	JP.L rom2_loader_return


