.org $9D93
.db $BB,$6D
#define equ .equ
#define EQU .equ
curRow               EQU  844Bh  ;0-7
#define bcall(xxxx)     rst 28h         \ .dw xxxx
_PutS		EQU 450Ah
_ClrScrnFull	EQU 4546h



ProgramStart:
	ret
	jr $
	bcall(_ClrScrnFull)
	ld hl,0
	ld (curRow),hl
	ld hl,str1
	bcall(_PutS)
	ret
str1:
.db "HELLO WORLD",0

