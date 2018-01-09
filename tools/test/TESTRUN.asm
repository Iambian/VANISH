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

ProgramStart:
	bcall(_ClrScrnFull)
	ld hl,64000
	SLL C
_:	push hl
		bcall(_HomeUp)
		bcall(_DispHL)
	pop hl
	inc hl
	ld a,h
	or l
	jr nz,-_
	ret
str1:
.db "HELLO WORLD",0

