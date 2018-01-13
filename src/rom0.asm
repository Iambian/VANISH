.ASSUME ADL=0
#include "src/inc/vm83plus.inc"    ;For VM.
.ORG rom0_base_adr
#define out_data(mem,port,rep) CALL outPortData&$FFFF \.dw (mem)&$FFFF,port \.db rep
#define in_data(mem,port,rep)  CALL inPortData&$FFFF  \.dw (mem)&$FFFF,port \.db rep

#include "src/sub/basepage.asm"    ;This must always be defined first.
#include "src/sub/interrupt.asm"   ;Where the interrupt routines live
#include "src/sub/r0_routines.asm" ;Other routines that goes in rom0
#include "src/sub/r0_bcalls.asm"   ;OS and boot code bcall tables


execAsmPrgm:
.assume adl=1
	JP.SIS (+_)&$FFFF
.assume adl=0
_:	CALL initHardware&$FFFF
	IM 1
	EI
	CALL $9D95
exitAsmPrgm:
	DI
	CALL restoreHardware&$FFFF
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
		out_data(wdtInitData,$6004,9)
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
	;set port and memory protections
	in_data(privCodeSave,$001D,9)
	out_data(privCodeSet,$001D,9)
	;Set up keyboard
	LD BC,$A000
	LD A,3
	OUT (BC),A
	LD C,$0C
	LD A,1
	OUT (BC),A
	;MASK OUT INTERRUPTS, LATCH ONLY ON KEY
	LD.LIL HL,($F00004)
	LD.LIL (_restoreHardwareInterruptWriteback),HL
	LD.LIL HL,1+(1<<10)  ;ON, KBD
	LD.LIL ($F00004),HL
	;Setup Emulator hardware (breakpoints)
	LD DE,$0038 \ SCF \ SBC.LIL HL,HL \ LD.LIL (HL),3 ;WRITING TO ANGRY ADDRESS
	LD DE,$0066 \ SCF \ SBC.LIL HL,HL \ LD.LIL (HL),3 ;WRITING TO ANGRY ADDRESS
	
	
	XOR A
	LD.LIL ($F20030),A  ;KILL GEN PURPOSE TIMERS
	RET
stopWdt:
	XOR A 
	LD BC,$600C
	OUT (BC),A   ;stop WDT
	RET
suspendWdt:
	LD A,%00010001
reconfigWdt:
	LD BC,$6000
	IN L,(BC)
	INC C
	IN H,(BC)
	LD C,$0C
	OUT (BC),A
	LD C,$04
	OUT (BC),L
	INC C
	OUT (BC),H
	RET
restartWdt:
	LD.LIL A,($F10010)
	AND 1
	CALL NZ,__MANUAL_NMI_SCREEN_UPDATE&$FFFF
	LD A,%00010101
	JR reconfigWdt
	
	
	
	
wdtInitData:
.db $22,$02,$00,$00  ;load register
.db $00,$00          ;restart register

privCodeSave:
.block 9
privCodeSet:
.dl $004000,$D40000,$D43FFF
keyboardScanSet:




OffpageRestoreHardware:  ;called from ADL mode
	CALL restoreHardware&$FFFF
	RET.L

restoreHardware:
	CALL stopWdt&$FFFF
	out_data(privCodeSave,$001D,9)
	LD BC,$A000
	XOR A
	OUT (BC),A  ;RESET KEYBOARD TO IDLE
	LD C,$0C
	LD A,0
	OUT (BC),A  ;TURN OFF KBD INTERRUPT FROM KBD SOURCE
_restoreHardwareInterruptWriteback .EQU $+2
	LD.LIL HL,0
	LD.LIL ($F00004),HL
	;unsets breakpoints
	LD DE,$0038 \ SCF \ SBC.LIL HL,HL \ LD.LIL (HL),4 ;WRITING TO ANGRY ADDRESS
	LD DE,$0066 \ SCF \ SBC.LIL HL,HL \ LD.LIL (HL),4 ;WRITING TO ANGRY ADDRESS
	RET
	
outPortData:
	CALL _cpydatreg_macro&$FFFF
	JP lowmem_oti2r&$FFFF
inPortData:
	CALL _cpydatreg_macro&$FFFF
	JP lowmem_ini2r&$FFFF
_cpydatreg_macro:	;MEM(2B),PORT(2B),REP(1B)
	POP HL      ;GET RET TO in/out RTN
	POP IX
	PEA IX+5
	PUSH HL
	LD HL,(IX+0)
	LD DE,(IX+2)
	LD C,(IX+4)
	LD B,0
	RET
	
	
	


.echo "rom0 size: ",$-rom0_base_adr," bytes"