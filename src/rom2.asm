.ASSUME ADL=1
#include "src/inc/vm83plus.inc"    ;For VM.
.ORG rom2_base_adr


#include "src/sub/r2_errors.asm"   ;Simulated, and internal error reporting
#include "src/sub/r2_screen.asm"   ;LCD routines and that which writes to it
#include "src/sub/r2_text.asm"     ;Text rendering



.echo "rom2 size: ",$-rom2_base_adr," bytes"
