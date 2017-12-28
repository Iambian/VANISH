#DEFINE rom0
.ASSUME ADL=0
.ORG 0
#include "src/vm83plus.inc"       ;For VM.

#include "src/sub/basepage.asm"    ;This must always be defined first.
#include "src/sub/r0_bcalls.asm"   ;OS and boot code bcall tables
#include "src/sub/r0_routines.asm" ;Other routines that goes in rom0


