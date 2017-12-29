;This will always be located in rom0. It is default ADL mode everywhere
;else. Interrupts will always be disabled when calling from proper entry
;points. 

.ASSUME ADL=0
.ORG 0
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
	JP $+3
	JR __BASE_INTERRUPT
.BLOCK $50-$ ;bjump
	RET
.BLOCK $59-$ ;errhandler on
;[2017-12-28 08:45.46] <jacobly> so it's basically push (errSP) \ push (FPS)-(fpBase) \ push (OPS)-(OPBase) \ ld (errSP),sp
	RET
.BLOCK $5C-$ ;errhandler off
	RET
.BLOCK $66-$ ;NMI vector
	RETN

.BLOCK $70-$  ;FIXED ADDRESS.
__BASE_INTERRUPT:
	DI
	;DO STUFF
	EI
	RET

__ROMCALL_RET_ROUTINE:
	PUSH AF
		LD A,I  ;INTERRUPT STATE IN P/V
		DI
		JP.LIL +_
.ASSUME ADL=1
_:		LD A,rom0_base_adr>>16
		LD MB,A
		JP.SIS +_
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
	JP.LIL rom2_loader_return


