.ASSUME ADL=1
#include "src/inc/vm83plus.inc"    ;For VM.
.ORG rom2_base_adr
	JP systemInit

#include "src/sub/r2_lcd.asm"           ;LCD driver routines

;---------------------------------------------------------------------------
.echo "rom2 size: ",$-rom2_base_adr," bytes"
