.org $9D93
.db $BB,$6D
#define equ .equ
#define EQU .equ
curRow               EQU  844Bh  ;0-7
#define bcall(xxxx)     rst 28h         \ .dw xxxx
_PutS			EQU 450Ah
_ClrScrnFull	EQU 4546h
_HomeUp 		EQU 4558h
_DispHL			EQU 4507h
_GetCSC			EQU 4018h
_CreateTempString EQU 4324h

ProgramStart:
	bcall(_HomeUp)
	ld hl,str1
	ld bc,9
	xor a
	cpir
	push bc
	pop hl
	bcall(_DispHL)
	ret




str1:
.db "01234567",0
	
	