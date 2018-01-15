.ASSUME ADL=0
#include "src/inc/vm83plus.inc"    ;For VM.
.ORG rom0_base_adr
#include "src/sub/adr0.asm"        ;This must always be defined first.
;------------------------------------------------------------------------
#include "src/sub/r0_int.asm"      ;Interrupt handlers
#include "src/sub/r0_hw.asm"       ;Hardware init/restore/manip
#include "src/sub/r0_misc.asm"     ;Other routines that should be in z80 space

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




	
	
	
	
.echo "rom0 size: ",$-rom0_base_adr," bytes"