;This will always be located in rom0. It is default ADL mode everywhere
;else. Interrupts will always be disabled when calling from proper entry
;points. 

.ASSUME ADL=0
.BLOCK (rom0_base_adr+$00)-$ ;rst 00h SYSTEM_RESET
rst_sysres:
	JR __SYS_RESET
.BLOCK (rom0_base_adr+$08)-$ ;rst 08h _Op1ToOp2
rst_op1toop2:
	bcall($412F)
	RET
.BLOCK (rom0_base_adr+$0C)-$ ;INTERNAL ROUTINE: lowmem_ini2r
lowmem_ini2r:
	INI2R
	RET
.BLOCK (rom0_base_adr+$10)-$ ;rst 10h _FindSym
rst_findsym:
	bcall($42F4)
	RET
.BLOCK (rom0_base_adr+$14)-$ ;INTERNAL ROUTINE: lowmem_oti2r
lowmem_oti2r:
	OTI2R
	RET
.BLOCK (rom0_base_adr+$18)-$ ;rst 18h _PushRealO1
rst_pushrealo1:
	bcall($43BA)
	RET
.BLOCK (rom0_base_adr+$1C)-$ ;EXPOSED ROUTINE: SET_LCD_ZADDR
SET_LCD_ZADDR:
	JR _LCDZADDR
.BLOCK (rom0_base_adr+$20)-$ ;rst 20h _Mov9ToOp1
rst_mov9toop1:
	bcall($417A)
	RET
.BLOCK (rom0_base_adr+$24)-$ ;EXPOSED ROUTINE: GET_SCANCODE
GET_SCANCODE:
	jr _GETSCANCODE
.BLOCK (rom0_base_adr+$28)-$ ;rst 28h BCALL_MACRO_ROUTINE
rst_bcallmacro:
	JP (r0_romcaller)&$FFFF
.BLOCK (rom0_base_adr+$2C)-$ ;INTERNAL ROUTINE: N/A
;
;
.BLOCK (rom0_base_adr+$30)-$ ;rst 30h _FPAdd
	bcall($4072)
	RET
.BLOCK (rom0_base_adr+$34)-$ ;INTERNAL ROUTINE: N/A
;
;
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
	JP __NMI_HANDLER&$FFFF
;------------------------------------------------------------
.BLOCK (rom0_base_adr+$70)-$  ;FIXED ADDRESS.
__SYS_RESET:
	DI
	CALL restoreHardware&$FFFF
	JP.LIL errtrap
_LCDZADDR:
	EX (SP),HL
	LD A,(HL)
	INC HL
	EX (SP),HL
	;A = CODE TO USE TO SCREW WITH LCD THINGS.
	RET
_GETSCANCODE:
	JP.LIL _
.ASSUME ADL=1
_:	CALL getscancode
	JP.SIS _&$FFFF
.ASSUME ADL=0
_:	RET


