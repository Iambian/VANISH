.ASSUME ADL=1
#include "src/inc/vm83plus.inc"    ;For VM.
.ORG rom2_base_adr
testObject:
	PUSH IX
		LD A,MB
		PUSH AF
			;BEGIN SYSTEM INITIALIZATION
			LD A,(rom0_base_adr>>16)&$FF
			LD MB,A
			CALL screenInit
			LD IY,flags
			;END SYSTEM INITIALIZATION
			RES.S textInverse,(IY+textFlags)
			SET.S appAutoScroll,(IY+appFlags)
			SET.S appTextSave,(IY+appFlags)
			RES.S preClrForMode,(IY+newDispF)
			;END DEBUG INITIALIZATIONS
			JR $
			CALL execAsmPrgm
		POP AF
		LD MB,A
	POP IX
	RET
testData: #include "src/sub/_tstdata.z80"
testText:
.db 6
.db %00011100
.db %00100010
.db %00100010
.db %00111110
.db %00100010
.db %00100010
.db %00100010
testString:
;    0123456789012345
.db "Dear World,     "
.db "  It seems that "
.db "at times, we may"
.db "disagree but I  "
.db "simply cannot   "
.db "take it anymore",0


#include "src/sub/r2_errors.asm"   ;Simulated, and internal error reporting
#include "src/sub/r2_screen.asm"   ;LCD routines and that which writes to it
#include "src/sub/r2_text.asm"     ;Text rendering



.echo "rom2 size: ",$-rom2_base_adr," bytes"
