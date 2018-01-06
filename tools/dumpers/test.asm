.ASSUME ADL=1
;All internal relocation MUST be ADL=1 (3 bytes data)
;algo looks forward for first zero, then keeps looking forward for
;first nonzero
;
;

.echo > "lib_syms.inc" "\n"
.echo > "lib_jptbl.inc" "\n"
.echo > "lib.h" "\n"
.echo > "tmpreloc.inc" "\n"
#define lib_total_lbl_count 0
#define lib_export_lbl_count 0

#macro export(label)
label:
#define mk_lbl concat("\"",label,"\"")
.echo >> "lib_syms.inc" mk_lbl," .equ ",eval(label),"\n"
#define mk_tmp eval(lib_total_lbl_count+1)
#define lib_total_lbl_count eval(mk_tmp)
#undefine mk_tmp
#undefine mk_lbl
#endmacro

#macro reloc_token()
#define mk_tmp eval(lib_export_lbl_count+1)
#define lib_export_lbl_count eval(mk_tmp)
#undefine mk_tmp
.echo >> "tmpreloc.inc" ".dw ",$,"\n"
#endmacro

.org 0




;direct call: HL= this address, DE= address of jump table in calling program
 jp LIBRARY_TAIL
;-----------------------------------------------------------------------------

;_exec_xor:
export(_exec_xor)
 ld b,a
exec_xor_loop:
 xor a
 dec b
reloc_token()
 jp nz,exec_xor_loop
 ret

export(_exec_or)
 or a
 ret
 
export(_exec_and)
 and a
 ret
 
 


;-----------------------------------------------------------------------------
LIBRARY_TAIL:
 ret