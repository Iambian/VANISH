.ASSUME ADL=1

defaultColorPalette:
.dw -1,0

screenInit:
	;resets all buffers to $00
	LD HL,internal_state
	PUSH HL \ POP DE \ INC DE
	LD BC,(display_buffer+9600)-internal_state-1
	LD (HL),$00
	LDIR
	;init screen state
	LD A,%01010101
	LD C,240
	LD HL,display_buffer
_:	LD B,40
_:	LD (HL),A
	INC HL
	DJNZ -_
	RLCA
	DEC C
	JR NZ,--_
	;Set LCD controller ports
	LD HL,defaultColorPalette
	CALL SetColorPalette
	LD IX,$E30200
	SCF
	SBC HL,HL
	LD (IX+0),HL
	INC HL
	LD (IX+2),HL          ;Set palette
	LD IXH,$00            ;Set IX to $E30000
	LD (IX+$18),%00100001 ;1bpp
	LD HL,display_buffer
	LD (IX+$10),HL        ;Set buffer location
	;Construct x3 zoom LUT
	LD IX,display_lut
	LD C,0
_:	LD A,C
	CALL _reverseA
	LD B,8
_:	RLCA \ ADC HL,HL \ RRCA \ RLCA \ ADC HL,HL \ RRCA \ RLCA \ ADC HL,HL
	DJNZ -_
	LD (IX+0),HL
	LEA IX,IX+3
	INC C
	JR NZ,--_
	RET
	
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

_reverseA:
	PUSH BC
		LD C,1
_:		RRA
		RL C
		JR NC,-_
		LD A,C
	POP BC
	RET

SetColorPalette: ;HL=ptr to palette
	PUSH DE
		PUSH BC
			LD DE,$E30200
			LD BC,4
			LDIR
		POP BC
	POP DE
	RET








