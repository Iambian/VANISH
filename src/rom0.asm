.ASSUME ADL=0
.ORG 0
#include "src/sub/basepage.asm"   ;This must always be defined first.
#include "src/sub/romcall.asm"    ;Contains romcall/basecall code
#include "src/sub/interrupt.asm"  ;Adjustable interrupt service routines.
#include "src/sub/btab_os.asm"    ;OS bcall table
#include "scc/sub/btab_boot.asm"  ;Boot code bcall table



