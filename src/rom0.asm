.ASSUME ADL=0
#include "src/inc/vm83plus.inc"    ;For VM.
.ORG rom0_base_adr

#include "src/sub/basepage.asm"    ;This must always be defined first.
#include "src/sub/r0_routines.asm" ;Other routines that goes in rom0
#include "src/sub/r0_bcalls.asm"   ;OS and boot code bcall tables


.echo "rom0 size: ",$-rom0_base_adr," bytes"