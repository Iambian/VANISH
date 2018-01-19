.ASSUME ADL=0
#include "src/inc/vm83plus.inc"    ;For VM.
.ORG rom0_base_adr
#include "src/sub/adr0.asm"        ;This must always be defined first.
;------------------------------------------------------------------------
#include "src/sub/r0_int.asm"      ;Interrupt handlers
#include "src/sub/r0_hw.asm"       ;Hardware init/restore/manip
#include "src/sub/r0_file.asm"     ;Filesystem stuff
#include "src/sub/r0_misc.asm"     ;Other routines that should be in z80 space

;Called directly from ADL mode using CALL.SIS
;Used to start program execution
execAsmPrgm:
	CALL initHardware&$FFFF
	IM 1
	EI
	CALL $9D95
exitAsmPrgm:
	DI
	CALL restoreHardware&$FFFF
	RET.L

;Called directly from ADL mode using CALL.SIS
;Used to initialize program memory
sysReset:
	;Init pointers to mem start: User RAM, Temp RAM, Floating Point Stack
	LD HL,userMem&$FFFF
	LD (tempMem&$FFFF),HL
	LD (fpBase&$FFFF),HL
	LD (FPS&$FFFF),HL
	;Init pointers to mem end: VAT, Operator Stack
	LD HL,symTable&$FFFF
	LD (progPtr&$FFFF),HL
	LD (pTemp&$FFFF),HL
	LD (OPBase&$FFFF),HL
	LD (OPS&$FFFF),HL
	RET
	
	
	
	
.echo "rom0 size: ",$-rom0_base_adr," bytes"