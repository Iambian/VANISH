;This will always be located in rom0. It is default ADL mode everywhere
;else. Interrupts will always be disabled when calling from proper entry
;points. 

.ASSUME ADL=0
.BLOCK (rom0_base_adr+$00)-$ ;rst 00h SYSTEM_RESET
	RET 
.BLOCK (rom0_base_adr+$08)-$ ;rst 08h _Op1ToOp2
	RET
.BLOCK (rom0_base_adr+$10)-$ ;rst 10h _FindSym
	RET
.BLOCK (rom0_base_adr+$18)-$ ;rst 18h _PushRealO1
	RET
.BLOCK (rom0_base_adr+$20)-$ ;rst 20h _Mov9ToOp1
	RET
.BLOCK (rom0_base_adr+$28)-$ ;rst 28h BCALL_MACRO_ROUTINE
	JP (r0_romcaller)&$FFFF
.BLOCK (rom0_base_adr+$30)-$ ;rst 30h _FPAdd
	RET
.BLOCK (rom0_base_adr+$38)-$ ;rst 38h INTERRUPT_SERVICE_ROUTINE
	JP ($+3)&$FFFF
	JR __BASE_INTERRUPT
.BLOCK (rom0_base_adr+$50)-$ ;bjump
	RET
.BLOCK (rom0_base_adr+$59)-$ ;errhandler on
;[2017-12-28 08:45.46] <jacobly> so it's basically push (errSP) \ push (FPS)-(fpBase) \ push (OPS)-(OPBase) \ ld (errSP),sp
	RET
.BLOCK (rom0_base_adr+$5C)-$ ;errhandler off
	RET
.BLOCK (rom0_base_adr+$66)-$ ;NMI vector
	RETN

.BLOCK (rom0_base_adr+$70)-$  ;FIXED ADDRESS.
__BASE_INTERRUPT:
	DI
	;DO STUFF
	EI
	RET


