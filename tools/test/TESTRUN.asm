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
	LD HL,1337
	bcall(_CreateTempString)
	JR $
	LD HL,666
	bcall(_CreateTempString)
	jr $
	ret
	
	
	
	
	bcall(_ClrScrnFull)
_:	ei
	bcall(_HomeUp)
	bcall(_GetCSC)
	ld L,A
	ld H,0
	bcall(_DispHL)
	jr -_

