.ASSUME ADL=1

systemInit:
	POP HL \ POP DE \ PUSH DE \ PUSH HL  ;GET PRGMPTR IN DE
	PUSH IX \ LD A,MB \	PUSH AF
		LD A,(rom0_base_adr>>16)&$FF \ LD MB,A
		LD.SIS SP,$FFF0
		LD (_sistk+1),SP
		PUSH DE
			CALL screenInit   ;INIT LCD EMULATION
			LD HL,ramStart    ;\
			LD BC,$8000       ; > RESET RAM TO ALL ZERO
			CALL MemSet       ;/
			SET.S appAutoScroll,(IY+appFlags)
			SET.S appTextSave,(IY+appFlags)
			;TODO: INIT SYSTEM MEMORY
		POP HL
		;TODO: INSERMEM WITH INPUT PROGRAM AND THEN COPY FROM OUR HL TO $9D95
		;      UNTIL THEN, DON'T ATTEMPT TO EXECTE ANYTHING. JUST QUIT.
		CALL updateScreen
_sistk: LD SP,(0)
	POP AF  \ LD MB,A \ POP IX
	RET

	
	
	
	
			;BEGIN SYSTEM INITIALIZATION
			LD (_curStackLevel),SP
			LD A,(rom0_base_adr>>16)&$FF
			LD MB,A
			CALL screenInit
			LD IY,flags
			;END SYSTEM INITIALIZATION
			RES.S textInverse,(IY+textFlags)    ;should be implemented soon
			SET.S appAutoScroll,(IY+appFlags)
			SET.S appTextSave,(IY+appFlags)
			RES.S preClrForMode,(IY+newDispF)
			
			RES.S textEraseBelow,(IY+textFlags) ;not implemented yet
			RES.S textWrite,(IY+sGrFlags)
			RES.S fracDrawLFont,(IY+fontFlags)
			
			;END DEBUG INITIALIZATIONS
			CALL execAsmPrgm
execExit:
_curStackLevel .EQU $+1
			LD SP,0
			CALL updateScreen
		POP AF
		LD MB,A
	POP IX
	RET













;===============================================================================
;Initialize LCD hardware

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
	LD E,1 \ RRA \ RL E \ JR NC,$-3 \ LD A,E ;REVERSE REG A
	LD B,8
_:	RLCA \ ADC HL,HL \ RRCA \ RLCA \ ADC HL,HL \ RRCA \ RLCA \ ADC HL,HL
	DJNZ -_
	LD (IX+0),HL
	LEA IX,IX+3
	INC C
	JR NZ,--_
	RET

defaultColorPalette:
.dw -1,0

SetColorPalette: ;HL=ptr to palette
	PUSH DE
		PUSH BC
			LD DE,$E30200
			LD BC,4
			LDIR
		POP BC
	POP DE
	RET










