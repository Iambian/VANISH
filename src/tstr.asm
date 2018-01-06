.db $BB,$6D
.org $9d95-2
#define bcall(x) rst 28h \ .dw x
_PutS .equ 450Ah
curRow .equ 844bh
curCol .equ 844Ch
test1  .EQU $D40001
test2  .EQU -8
programstart:
	ld hl,0
	ld (currow),hl
	ld hl,str1
	bcall(_PutS)
	ret
str1:
;    0123456789012345
.db "Dear world,     "
.db "  I can't take  "
.db "it anymore...   ",0


