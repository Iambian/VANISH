.ASSUME ADL=0
#include "src/inc/vm83plus.inc"    ;For VM.
.ORG rom0_base_adr

#include "src/sub/basepage.asm"    ;This must always be defined first.
#include "src/sub/interrupt.asm"   ;Where the interrupt routines live
#include "src/sub/r0_routines.asm" ;Other routines that goes in rom0
#include "src/sub/r0_bcalls.asm"   ;OS and boot code bcall tables


execAsmPrgm:
.assume adl=1
	JP.SIS (+_)&$FFFF
.assume adl=0
_:	CALL initHardware&$FFFF
	CALL $9D95
	CALL stopWdt&$FFFF
.assume adl=1
	JP.LIL +_
_:	RET
.assume adl=0




;NEVER CALL THIS ROUTINE FROM ADL MODE EVEN IF SWITCHING TO Z80 MODE.
;THIS ROUTINE START HARDWARE THAT CAN CAUSE AN NMI.
initHardware:
	;setup WDT
	CALL stopWdt&$FFFF
	PUSH BC
		LD BC,12
		LD HL,wdtInitData&$FFFF
		LD DE,$6004  ;WDT, copy data
		OTI2R
	POP BC
	LD C,$18
	OUT (BC),A  ;Interrupt length register. Writing a 0 until we know.
	LD C,$14
	INC A
	OUT (BC),A  ;Status clear register. Write 1 to reset bit 0 of status reg.
	LD C,$0C
	LD A,%00010101  ;Enable timer, triggers NMI, uses 32khz clock
	OUT (BC),A
	LD A,$B9
	LD C,$08
	OUT (BC),A
	LD A,$5A
	INC C
	OUT (BC),A
	;init other hardware
	;
	RET
stopWdt:
	XOR A 
	LD BC,$600C
	OUT (BC),A   ;stop WDT
	RET
	
	
	
	
	
wdtInitData:
.db $22,$02,$00,$00  ;load register
.db $00,$00          ;restart register





.echo "rom0 size: ",$-rom0_base_adr," bytes"