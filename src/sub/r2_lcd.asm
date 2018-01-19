.ASSUME ADL=1

ClrLCDFull:
clearScreen:
	LD HL,screen_buffer
	CALL clearBuffer
	JR updateScreen
	
clearBuffer:
	LD BC,767
	
clearMem:
	PUSH HL \ POP DE \ INC DE
	LD BC,767
	LD (HL),$00
	LDIR
	RET
	
GrBufClr:
	LD HL,plotsscreen
	JR clearBuffer
	
GrBufCpy: ;TODO: (winBtm) should be =8, use split screen settings
	LD HL,plotsscreen
	LD DE,screen_buffer
	LD BC,768
	LDIR
	RET
	
ClrScrnFull:
	CALL clearScreen
	BIT.S appTextSave,(IY+appFlags)
	RET Z
ClrTxtShd:
	LD HL,textShadow
	LD BC,127
	JR clearMem
	
updateScreen:
	PUSH AF
	PUSH BC \ PUSH DE \ PUSH HL \ PUSH IX \ PUSH IY
	LD IY,screen_buffer
	LD IX,display_buffer+(24*40)+2
	LD DE,display_lut
	LD C,64
_:	LD B,12
_:	LD L,(IY+0)
	LD H,3
	MLT HL
	ADD HL,DE
	LD HL,(HL)
	LD (IX+00),HL
	LD (IX-40),HL
	LD (IX+40),HL
	INC IY
	LEA IX,IX+3
	DJNZ -_
	LEA IX,IX+84
	DEC C
	JR NZ,--_
	POP IY  \ POP IX  \ POP HL  \ POP DE  \ POP BC
	POP AF
	RET








