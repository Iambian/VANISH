.ASSUME ADL=0

__BASE_INTERRUPT:
	PUSH AF \ PUSH HL
	;Should deal in keyboard, debouncing, etc
	LD.LIL HL,($F00014)
	BIT 0,L \ JP NZ,exitAsmPrgm&$FFFF
	BIT 2,H
	JR Z,_
	PUSH BC
		bcall(_KbdScan)
		LD BC,$A008
		IN A,(BC)       ;b0: scanComplete, b1:kpad data reg changed
		OUT (BC),A      ;b2: key pushed in mode 1
	POP BC
_:	;Stop doing the stuff here.
	POP HL  \ POP AF
	EI
	RET

	
__MANUAL_NMI_SCREEN_UPDATE:
	PUSH AF \ PUSH BC
		LD B,$60
		JR +_
__NMI_HANDLER:
	PUSH AF \ PUSH BC
		LD BC,$6010
		IN A,(BC)
		AND 1
		JR Z,__NMI_SYSTEM_FAULT
		LD C,$0C  ;FLAGS
		XOR A
		OUT (BC),A  ;KILLS WDT
_:		JP.LIL _
.ASSUME ADL=1
_:		CALL updateScreen
		JP.SIS _&$FFFF
.ASSUME ADL=0
_:		LD A,$20
		LD C,$04 ;LOAD+0 REGISTER
		OUT (BC),A
		INC C
		LD A,$02 ;LOAD+1 REGISTER
		OUT (BC),A
		LD C,$14 ;WDT CLEAR REGISTER
		XOR A
		OUT (BC),A
		LD C,$0C ;WDT FLAGS
		LD A,%00010101 ;TIMER ENABLE, GEN NMI, USE 32KHZ CLOCK
		OUT (BC),A
	POP BC \ POP AF
	RETN

__NMI_SYSTEM_FAULT:
	CALL restoreHardware&$FFFF
	JP.LIL errnonmi
	


