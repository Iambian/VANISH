.ASSUME ADL=1
#include "src/inc/vm83plus.inc"    ;For VM.
.ORG rom2_base_adr
testObject:
	PUSH IX
		CALL screenInit
		LD HL,testData
		LD DE,screen_buffer
		LD BC,768
		LDIR
		CALL updateScreen
		;CALL clearScreen
		
		
		
		
	POP IX
	RET
testData: #include "src/sub/_tstdata.z80"



#include "src/sub/r2_errors.asm"   ;Simulated, and internal error reporting
#include "src/sub/r2_screen.asm"   ;LCD routines and that which writes to it
#include "src/sub/r2_text.asm"     ;Text rendering



.echo "rom2 size: ",$-rom2_base_adr," bytes"
