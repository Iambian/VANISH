.ASSUME ADL=1


LoadPattern:
	LD L,A
	LD H,8
	MLT HL
	BIT.S fracDrawLFont,(iy+fontFlags)
	JR Z,Load_SFont
Load_LFont:
Load_LFont2:
	LD DE,lfont_record
	PUSH DE \ PUSH AF \ PUSH BC
		LD A,6
		LD (DE),A
		INC DE
		;You'll want to check to see if you're using a font hook/customFont
		;then jump to that routine since copying to lfont_record is much
		;more straightfoward in that case.
		CALL divHLby8
		LD BC,lfont_table
		LD A,L
		CP 171
		JR NC,_loadLFont_getslack
		LD H,7
		MLT HL
		ADD HL,BC  ;OFFSET+TABLE = ADDRESS TO ENTRY
		LD B,7
_loadLFont_getmainloop:
		LD A,(HL)
		INC HL
		ADD A,A
		AND %00111110
		LD (DE),A
		INC DE
		DJNZ _loadLFont_getmainloop
	POP BC \ POP AF \ POP HL
	RET
_loadLFont_getslack:
		LD H,14
		MLT HL
		ADD HL,BC
		LD B,7
_loadLFont_getslackloop:
		LD A,(HL)
		INC HL
		RRCA 
		RRCA
		RRCA
		XOR (HL)
		AND %00011100
		XOR (HL)
		RRA
		OR A
		RRA  ;MAKE SURE IT'S %--BBBAAA
		INC HL
		LD (DE),A
		INC DE
		DJNZ _loadLFont_getslackloop
	POP BC \ POP AF \ POP HL
	RET
Load_SFont:
	LD DE,sfont_record
	PUSH DE \ PUSH AF \ PUSH BC
		;You'll want to check to see if you're using a font hook/customFont
		;then jump to that routine since copying to sfont_record is much
		;more straightfoward in that case.
		CALL divHLby8
		LD BC,sfont_table
		LD H,4
		MLT HL
		ADD HL,BC
		LD A,(HL)
		INC HL
		LD C,A
		RLCA
		PUSH AF
			RLCA
			RLCA
			RLCA
			AND %00000111
			LD (DE),A
			INC DE
		POP AF
		JR C,_load_sfont_6pxw
_load_sfont_4pxw:
		LD A,C
		AND %00001111
		LD (DE),A
		INC DE
		LD B,3
_load_sfont_4pxwloop:
		RLD
		LD (DE),A
		INC DE
		RLD
		LD (DE),A
		INC DE
		RLD
		INC HL
		DJNZ _load_sfont_4pxwloop
	POP BC \ POP AF \ POP HL
	RET
_load_sfont_6pxw:
		LD B,%00111111
		LD A,(HL)  ;NEED 2 UPPER BITS
		RRCA
		RRCA
		XOR C
		AND %11110000
		XOR C
		AND B
		LD (DE),A  ;R0
		INC DE
		LD A,(HL)  ;NOW USE LOWER 6 BITS
		INC HL
		AND B
		LD (DE),A  ;R1
		INC DE
		LD A,(HL)
		INC HL
		AND B
		LD (DE),A  ;R2. THE UPPER 2 BITS ARE UNUSED. CLEARED.
		INC DE
		LD L,(HL)
		LD H,3
		MLT HL
		LD BC,sfont_table+1024
		ADD HL,BC  ;GET SECONDARY TABLE ENTRY
		LD BC,(3*256)+0
_load_sfont_6pxwloop:
		LD A,(HL)
		INC HL
		OR A
		RLA
		RL C
		RLA
		RL C
		RRA
		RRA   ;%--nnnnnn
		LD (DE),A ;R3, R4, R5
		INC DE
		DJNZ _load_sfont_6pxwloop
		LD A,C
		LD (DE),A ;R6
	POP BC \ POP AF \ POP HL
	RET
	
SFont_Len:
	CALL DivHLby8
_sFont_Len_prediv:
	LD H,4
	MLT HL
	LD DE,sfont_table
	ADD HL,DE
	LD A,(HL)
	RLCA
	RLCA
	RLCA
	RLCA
	AND 15
	RET
	
	
;in: DE= 7h x (+0)w pointer to sprite (right aligned)
;    IX= screen buffer start (full 24-bit address)
;    BC= XY ([0:96],[0:64])
dispChar:
	LD A,(DE)
	ADD A,B
	CP 96+1
	CCF
	RET C ;QUIT IF ANY OF THE SPRITE WOULD CLIP PAST THE RIGHT EDGE
	LD A,C
	CP 58+1
	CCF
	RET C ;QUIT IF ANY OF THE SPRITE WOULD CLIP PAST BOTTOM OF SCREEN
	LD A,B  ;PRESERVE X POSITION FOR LATER ADDITION
	LD B,12
	MLT BC  ;Y*12, clears BCU
	LD L,A
	LD H,32 ;DO X/8 BY WAY OF (X*32)/256
	MLT HL
	LD L,H
	LD H,0
	ADD HL,BC ;HL IS COMPLETED OFFSET
	EX DE,HL
	ADD IX,DE ;IX IS COMPLETED ADDRESS
	EX DE,HL
	LD C,A    ;PRESERVE X AGAIN TO LATER DO CLIP CHECKING AGAINST FINAL COLUMN
	AND 7     ;GET LOW BITS OF A FOR PROPER BIT SHIFTING ACTION
	LD H,A
	LD A,(DE)
	LD L,A
	LD A,16
	SUB A,H   ;X.
	SUB A,L   ;W. 16-X-W FOR LOOP PARAMS
	LD (dispChar_subloop_params),A
	LD B,L    ;REUSE W TO CREATE MASK
	SCF
	SBC HL,HL ;HL TO -1
_:	ADD HL,HL
	DJNZ -_
	LD B,A    ;REUSE LOOP PARAMS TO PROPERLY SHIFT MASK
_:	SCF
	ADC HL,HL ;MAKING SURE ALL THE BITS THAT GET FILLED IN ARE 1s.
	DJNZ -_
	BIT.S textInverse,(IY+textFlags)
	LD A,L
	LD (dispChar_maskhigh),A
	JR Z,$+4 \ CPL \ LD L,A
	LD A,H
	LD (dispChar_masklow),A
	JR Z,$+4 \ CPL \ LD H,A
	JR NZ,$+5 \ OR A \ SBC HL,HL
	LD A,L
	LD (dispChar_inversemaskhigh),A
	LD A,H
	LD (dispChar_inversemasklow),A
	INC DE
	LD B,7    ;ITERATE 7 TIMES.
dispChar_mainloop:
	EX DE,HL
	LD E,(HL)
	INC HL
	LD D,0
	EX DE,HL
	LD A,B
dispChar_subloop_params .EQU $+1
	LD B,0
_:	ADD HL,HL
	DJNZ -_
	LD B,A
	LD A,(IX+0)
dispChar_masklow .EQU $+1
	AND A,0
	OR H
dispChar_inversemasklow .EQU $+1
	XOR A,0
	LD (IX+0),A
	LD A,C
	CP 88
	JR NC,dispChar_clipright
	LD A,(IX+1)
dispChar_maskhigh .EQU $+1
	AND A,0
	OR L
dispChar_inversemaskhigh .EQU $+1
	XOR A,0
	LD (IX+1),A
dispChar_clipright:
	LEA IX,IX+12
	DJNZ dispChar_mainloop
	OR A  ;kills carry
	RET
	
	
;in: A = char, curRow, curCol, flags
;out:character displayed, curRow/curCol updated
;dest: All regs preserved. Calls PutMap to do character display.
PutC:
	CALL PutMap
	PUSH AF
		LD A,(curCol)
		ADD A,%11110001    ;Cause a carry if going past 15
		PUSH AF
			AND A,%00001111
			LD (curCol),A
		POP AF
		CALL C,NewLine
	POP AF
	RET
PutMap:
	PUSH AF \ PUSH BC \ PUSH DE \ PUSH HL \ PUSH IX
		PUSH AF
			LD L,A
			LD H,8
			MLT HL
			CALL Load_LFont
			EX DE,HL
			LD HL,(curRow)
			PUSH HL
				LD A,H
				CP 16
				JR C,+_
			POP HL
		POP AF
		JR _putmap_donotrender
_:				LD A,L
				ADD A,A
				ADD A,A
				ADD A,A
				LD C,A
				LD L,6
				MLT HL
				LD B,L
				LD IX,screen_buffer
;				LD DE,lfont_record
				CALL dispChar  ;BC=XY
			POP HL
			BIT.S appTextSave,(IY+appFlags)
			JR Z,_putmap_notextshadowcopy
			LD A,H  ;L=cr,H=cc -> -CCCCCRRR
			RLCA
			RLCA
			RLCA
			XOR L
			AND %11111000
			XOR L
			SBC HL,HL  ;CLEARS HL
			LD L,A     ;AND SETS IT TO OFFSET
			LD DE,textShadow
			ADD HL,DE
		POP AF
		LD (HL),A
		PUSH AF
_putmap_notextshadowcopy:
		POP AF
_putmap_donotrender:
	POP IX \ POP HL \ POP DE \ POP BC \ POP AF
	RET

	
NewLine:
	PUSH HL
		LD.S HL,(curRow)
		LD H,0
		LD A,L
		INC A
		BIT.S appAutoScroll,(IY+appFlags)
		JR Z,_newline_skipscrollcheck
		LD L,A
		LD A,8  ;TODO: change later to (winBtm)
		DEC A
		CP L    ;IF MOVED TO LAST ROW, REJECT CHANGE AND SCROLL SCREEN UPWARD
		JR NZ,_newline_skipscrollcheck
		DEC L
		PUSH HL
			PUSH DE
				PUSH BC
					LD DE,screen_buffer
					LD HL,screen_buffer+(8*12)
					LD BC,7*8*12  ;6 rows of 8*12 pixels. Bottom row copied.
					LDIR
					PUSH DE
					POP HL
					INC DE
					LD (HL),$00
					LD BC,(7*8)-1 ;clear bottom row
					LDIR
				POP BC
			POP DE
		POP HL
_newline_skipscrollcheck:
		LD.S (curRow),HL
	POP HL
	RET
	
PutSInternal:
	LD A,(HL)
	INC HL
	OR A
	RET Z
	CALL PutC
	JR PutSInternal
	
PutS:
	PUSH AF
_:		LD.S A,(HL)
		OR A
		JR Z,+_
		INC.S HL
		CALL PutC
		JR -_
_:	POP AF
	RET
	
PutPS:
	LD B,(HL)
	INC B
	DEC B
	RET Z
	INC HL
_:	LD A,(HL)
	INC HL
	CALL PutC
	LD A,(curRow)
	LD C,A
	LD A,8  ;TODO: Replace later with (winBtm)
	CP C
	RET Z
	DJNZ -_
	RET

divHLby8:
	SRL H \ RR L
	SRL H \ RR L
	SRL H \ RR L
	RET

DispHL:
	SET.S leadingSpace,(IY+internalFlags)
	PUSH BC
		LD BC,Op1
		PUSH BC
			LD DE,-10000
			CALL _disphl_subr
			LD DE,-1000
			CALL _disphl_subr
			LD DE,-100
			CALL _disphl_subr
			LD E,-10
			CALL _disphl_subr
			RES.S leadingSpace,(IY+internalFlags)
			LD E,-1
			CALL _disphl_subr
			XOR A
			LD (BC),A
		POP HL
	POP BC
PutSTrunc:
	LD A,(curCol)
	LD D,(HL)
	INC HL
	INC D
	DEC D
	RET Z
	CP 15
	LD A,D
	JR NC,_putstrunclast
	CALL PutC
	JR PutSTrunc
_putstrunclast:
	JP PutMap
	
	
	
_disphl_subr:
	LD A,'0'-1
_:	INC A
	ADD HL,DE
	JR C,-_
	SBC HL,DE
	CP '0'
	JR NZ,+_
	BIT.S leadingSpace,(IY+internalFlags)
	JR Z,++_
	LD A,' '
	JR ++_
_:	RES.S leadingSpace,(IY+internalFlags)
_:	LD (BC),A
	INC BC
	RET
	
HomeUp:
	PUSH AF
		PUSH HL
			LD HL,curRow
			LD A,0  ;TODO: REPLACE WITH (winTop)
			LD (HL),A
			INC HL
			LD (HL),0
		POP HL
	POP AF
	RET
	
DispHLHex:
	LD A,H
	CALL DispAHex
	LD A,L
DispAHex:
	PUSH AF
		RRA
		RRA
		RRA
		RRA
		CALL _
	POP AF
_	OR A,$F0
	DAA
	ADD A,$A0
	ADC A,$40
	jp PutC
	
	
VPutMap:
	PUSH BC
		PUSH HL
			CALL LoadPattern ;Our variant returns s/lfont_record in HL.
			EX DE,HL
			LD IX,screen_buffer
			BIT.S textWrite,(IY+sGrFlags)
			JR Z,_
			LD IX,plotsscreen
_:			LD HL,(penCol) ;(X,Y) = (penCol,penRow) = [L,H]
			LD C,H
			LD B,L
			LD A,(DE)      ;CHARACTER WIDTH
			PUSH DE
				CALL dispChar  ;also sets carry if could not fit on screen
			POP DE
			JR C,_
			LD HL,penCol
			LD A,(DE)
			ADD A,(HL)
			LD (HL),A
_:		POP HL
	POP BC
	RET
		
VPutSInternal:
	LD A,(HL)
	INC HL
	OR A
	RET Z
	CALL VPutMap
	RET C
	JR VPutSInternal
		
VPutS:
	PUSH AF \ PUSH DE \ PUSH IX
_:		LD.S A,(HL)
		INC HL
		OR A
		JR Z,VPutSEnd
		CALL VPutMap
		JR NC,-_
VPutSEnd:
	POP IX \ POP DE \ POP AF
	RET
		

VPutSN:
	PUSH AF \ PUSH DE \ PUSH IX
_:		LD A,(HL)
		INC HL
		CALL VPutMap
		JR C,VPutSEnd
		DJNZ -_
		JR VPutSEnd

SStringLength:
	PUSH HL
		LD B,0
_:		LD A,(HL)
		INC HL
		OR A
		JR Z,_
		PUSH HL
			LD L,A
			CALL _sFont_Len_prediv
		POP HL
		ADD A,B
		LD B,A
		JR -_
_:	POP HL
	RET
			
			
		
		






