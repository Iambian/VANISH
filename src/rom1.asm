.ASSUME ADL=1
#include "src/inc/vm83plus.inc"    ;For VM.
.ORG rom1_base_adr

#include "src/sub/r1_init.asm"     ;System memory initialization
#include "src/sub/r1_err.asm"      ;Error handler
#include "src/sub/r1_kbd.asm"      ;keyboard routines
#include "src/sub/r1_text.asm"     ;Text rendering routines

;---------------------
;Tables
#include "src/dat/bcalls.asm"     ;system call tables (OS,boot)
#include "src/dat/fonts.asm"      ;large and small font data tables

;------------------------------------------------------------------------------
.echo "rom1 size: ",$-rom1_base_adr," bytes"
