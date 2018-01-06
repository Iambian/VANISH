.ASSUME ADL=1
#include "src/inc/vm83plus.inc"    ;For VM.
.ORG rom1_base_adr
.db $C9



.echo "rom1 size: ",$-rom1_base_adr," bytes"
