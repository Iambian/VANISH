.ASSUME ADL=0

__BASE_INTERRUPT:
	DI
	;Should deal in keyboard, debouncing, etc
	
	;Stop doing the stuff here.
	EI
	RETI

	
__MANUAL_NMI_SCREEN_UPDATE:
	PUSH AF \ PUSH BC
		JR +_
__NMI_HANDLER:
	PUSH AF \ PUSH BC
		LD BC,$6010
		IN A,(BC)
		AND 1
_:		JP.LIL _
.ASSUME ADL=1
_:		JP Z,errnonmi
		CALL updateScreen
		JP.SIS _&$FFFF
.ASSUME ADL=0
_:		LD A,$20
		LD C,$04 ;LOAD+0 REGISTER
		OUT (BC),A
		INC C
		LD A,$02 ;LOAD+1 REGISTER
		OUT (BC),A
		LD C,$0C ;WDT FLAGS
		LD A,%00010101 ;TIMER ENABLE, GEN NMI, USE 32KHZ CLOCK
		OUT (BC),A
	POP BC \ POP AF
	RETN



