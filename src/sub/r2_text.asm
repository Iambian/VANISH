LoadPattern:
	LD L,A
	LD H,8
	MLT HL
	BIT.S fracDrawLFont,(iy+fontFlags)
	JR Z,Load_SFont
Load_LFont:
Load_LFont2:
	LD DE,lfont_record
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
	RET
Load_SFont:
	LD DE,sfont_record
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
	RET
	
	
;in: DE= 7h x (+0)w pointer to sprite (right aligned)
;    IX= screen buffer start (full 24-bit address)
;    BC= XY ([0:96],[0:64])
dispChar:
	LD A,(DE)
	ADD A,B
	CP 96+1
	RET NC ;QUIT IF ANY OF THE SPRITE WOULD CLIP PAST THE RIGHT EDGE
	LD A,C
	CP 58+1
	RET NC ;QUIT IF ANY OF THE SPRITE WOULD CLIP PAST BOTTOM OF SCREEN
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
	LD A,L
	LD (dispChar_maskhigh),A
	LD A,H
	LD (dispChar_masklow),A
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
	LD (IX+0),A
	LD A,C
	CP 88
	JR NC,dispChar_clipright
	LD A,(IX+1)
dispChar_maskhigh .EQU $+1
	AND A,0
	OR L
	LD (IX+1),A
dispChar_clipright:
	LEA IX,IX+12
	DJNZ dispChar_mainloop
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
				LD DE,lfont_record
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
		LD A,8  ;change later to (winBtm)
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
	
divHLby8:
	PUSH BC
		LD B,3
_:		SRL H \ RR L
		DJNZ -_
	POP BC
	RET

DispHL:
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
	LD A,' '
_:	LD (BC),A
	INC BC
	RET
	
	
	
	
	
	
	
	


lfont_table:
.db $07,$52,$03,$33,$50,$98,$49,$80,$40,$96,$49,$89,$92,$72,$00,$20 ; 0000
.db $91,$51,$11,$13,$4D,$80,$40,$91,$51,$8A,$8A,$64,$80,$40,$11,$11 ; 0010
.db $55,$95,$4A,$80,$48,$8C,$4E,$8C,$88,$60,$84,$0E,$1F,$2E,$4E,$80 ; 0020
.db $40,$80,$40,$8E,$CE,$9F,$4E,$64,$02,$45,$04,$24,$44,$94,$48,$80 ; 0030
.db $51,$8A,$C4,$8A,$51,$60,$00,$20,$80,$4E,$0A,$0E,$40,$80,$40,$80 ; 0040
.db $C4,$8E,$44,$60,$80,$40,$00,$00,$44,$80,$40,$80,$40,$80,$DC,$88 ; 0050
.db $48,$68,$8C,$62,$4C,$82,$0C,$80,$40,$9F,$98,$78,$1E,$38,$18,$F8 ; 0060
.db $07,$04,$04,$04,$94,$6C,$04,$83,$41,$99,$81,$61,$00,$E0,$4C,$22 ; 0070
.db $84,$48,$4E,$80,$40,$C0,$40,$A1,$C2,$84,$48,$9F,$4C,$32,$92,$4C ; 0080
.db $00,$00,$80,$B6,$58,$D0,$50,$80,$40,$80,$4E,$04,$84,$04,$04,$20 ; 0090
.db $00,$01,$06,$18,$06,$01,$00,$1F,$02,$82,$1F,$44,$1F,$28,$08,$10 ; 00A0
.db $0C,$03,$0C,$10,$00,$1F,$00,$00,$87,$40,$00,$00,$00,$00,$00,$0F ; 00B0
.db $08,$0E,$08,$0F,$00,$24,$02,$1F,$02,$24,$00,$40,$00,$97,$55,$95 ; 00C0
.db $95,$77,$04,$2E,$15,$24,$04,$04,$04,$24,$04,$24,$04,$35,$0E,$24 ; 00D0
.db $00,$00,$00,$00,$40,$60,$80,$84,$84,$84,$84,$80,$44,$64,$8A,$2A ; 00E0
.db $4A,$40,$40,$40,$80,$6A,$4A,$5F,$4A,$5F,$8A,$AA,$08,$0A,$0E,$02 ; 00F0
.db $42,$40,$40,$B8,$99,$02,$84,$08,$93,$03,$08,$14,$14,$08,$15,$12 ; 0100
.db $0D,$24,$84,$44,$40,$80,$C0,$E0,$82,$24,$08,$48,$08,$24,$82,$08 ; 0110
.db $C4,$62,$42,$82,$84,$68,$00,$04,$15,$0E,$95,$64,$00,$80,$84,$E4 ; 0120
.db $1F,$84,$84,$60,$80,$20,$00,$20,$0C,$24,$08,$20,$00,$20,$1F,$20 ; 0130
.db $80,$20,$00,$00,$00,$40,$00,$2C,$8C,$00,$81,$22,$44,$48,$50,$80 ; 0140
.db $0E,$11,$13,$15,$99,$91,$8E,$84,$8C,$84,$44,$E4,$04,$8E,$0E,$11 ; 0150
.db $01,$02,$C4,$E8,$9F,$5F,$82,$44,$82,$41,$D1,$8E,$02,$06,$8A,$32 ; 0160
.db $5F,$42,$42,$5F,$90,$7E,$01,$41,$11,$8E,$C6,$E8,$10,$5E,$11,$31 ; 0170
.db $8E,$1F,$01,$22,$04,$48,$C8,$E8,$0E,$11,$11,$0E,$D1,$71,$8E,$8E ; 0180
.db $91,$91,$8F,$81,$02,$6C,$00,$0C,$0C,$00,$CC,$6C,$00,$A0,$0C,$2C ; 0190
.db $40,$2C,$84,$08,$02,$24,$08,$30,$88,$64,$42,$A0,$80,$7F,$00,$3F ; 01A0
.db $00,$20,$88,$64,$42,$81,$42,$84,$48,$8E,$91,$41,$82,$44,$C0,$C4 ; 01B0
.db $CE,$F1,$15,$17,$54,$90,$8F,$4E,$11,$31,$9F,$51,$51,$91,$DE,$F1 ; 01C0
.db $11,$1E,$51,$91,$5E,$8E,$D1,$70,$50,$10,$91,$6E,$5E,$31,$91,$11 ; 01D0
.db $51,$31,$1E,$1F,$10,$10,$1E,$10,$10,$1F,$1F,$10,$10,$1E,$10,$10 ; 01E0
.db $10,$0E,$11,$10,$17,$11,$51,$AF,$11,$11,$91,$1F,$91,$31,$91,$6E ; 01F0
.db $84,$24,$84,$04,$04,$0E,$07,$02,$02,$02,$02,$F2,$0C,$F1,$12,$F4 ; 0200
.db $18,$14,$12,$11,$90,$10,$90,$10,$90,$10,$1F,$31,$1B,$55,$15,$51 ; 0210
.db $11,$51,$11,$11,$19,$15,$13,$11,$91,$6E,$11,$11,$11,$11,$11,$0E ; 0220
.db $9E,$71,$91,$1E,$90,$70,$10,$4E,$91,$71,$11,$15,$12,$0D,$9E,$71 ; 0230
.db $91,$5E,$94,$72,$11,$0F,$10,$10,$0E,$01,$01,$1E,$1F,$64,$84,$04 ; 0240
.db $04,$24,$84,$11,$11,$71,$11,$11,$11,$0E,$11,$11,$11,$11,$0A,$0A ; 0250
.db $04,$11,$11,$11,$15,$15,$15,$0A,$11,$51,$0A,$04,$0A,$D1,$11,$51 ; 0260
.db $11,$51,$8A,$44,$04,$24,$1F,$21,$82,$44,$88,$F0,$5F,$86,$89,$F1 ; 0270
.db $1F,$91,$12,$8C,$00,$90,$48,$44,$82,$41,$00,$2C,$84,$44,$84,$84 ; 0280
.db $44,$0C,$C4,$EA,$51,$80,$00,$A0,$00,$E0,$00,$A0,$00,$80,$00,$9F ; 0290
.db $04,$04,$02,$00,$80,$60,$40,$80,$80,$EE,$01,$8F,$11,$6F,$10,$10 ; 02A0
.db $16,$19,$11,$31,$1E,$20,$00,$2E,$10,$30,$D1,$2E,$41,$81,$4D,$D3 ; 02B0
.db $51,$F1,$CF,$E0,$C0,$AE,$D1,$9F,$50,$8E,$06,$A9,$88,$5C,$48,$28 ; 02C0
.db $48,$20,$4F,$31,$91,$4F,$01,$AE,$10,$10,$16,$59,$11,$F1,$91,$E4 ; 02D0
.db $00,$EC,$04,$44,$04,$0E,$C2,$E0,$C6,$E2,$C2,$F2,$CC,$E8,$C8,$E9 ; 02E0
.db $CA,$EC,$CA,$E9,$CC,$E4,$C4,$C4,$44,$84,$8E,$40,$C0,$DA,$D5,$D5 ; 02F0
.db $D1,$D1,$C0,$E0,$D6,$D9,$51,$B1,$51,$80,$40,$AE,$51,$B1,$D1,$EE ; 0300
.db $C0,$E0,$DE,$D1,$5E,$F0,$50,$C0,$40,$AD,$53,$CF,$C1,$E1,$00,$00 ; 0310
.db $16,$19,$10,$10,$10,$00,$00,$0E,$10,$0E,$C1,$FE,$08,$28,$9C,$68 ; 0320
.db $48,$A9,$06,$20,$00,$31,$11,$11,$D3,$ED,$00,$20,$91,$51,$91,$6A ; 0330
.db $84,$40,$80,$51,$11,$15,$D5,$EA,$00,$20,$91,$0A,$84,$2A,$91,$40 ; 0340
.db $80,$31,$11,$0F,$C1,$EE,$00,$00,$1F,$02,$04,$48,$1F,$23,$84,$04 ; 0350
.db $48,$04,$04,$03,$04,$C4,$04,$E4,$84,$64,$C4,$38,$C4,$04,$42,$04 ; 0360
.db $04,$18,$C0,$E8,$D5,$62,$C0,$20,$C0,$1F,$5F,$11,$1F,$11,$1F,$1F ; 0370
.db $00,$00,$0E,$0A,$0A,$8A,$0E,$C0,$00,$E4,$8C,$E4,$C4,$E4,$00,$00 ; 0380
.db $8C,$02,$44,$28,$4E,$E0,$40,$2C,$82,$04,$02,$0C,$00,$00,$08,$2A ; 0390
.db $8E,$42,$82,$40,$80,$4E,$08,$2C,$02,$0C,$00,$00,$06,$88,$0E,$0A ; 03A0
.db $0E,$20,$00,$0E,$42,$04,$08,$08,$00,$20,$8E,$6A,$CE,$EA,$8E,$60 ; 03B0
.db $80,$6E,$8A,$6E,$02,$0C,$02,$04,$8E,$71,$91,$7F,$91,$68,$C4,$EE ; 03C0
.db $91,$71,$1F,$31,$44,$AA,$80,$4E,$51,$BF,$91,$4A,$40,$AE,$91,$51 ; 03D0
.db $5F,$B1,$02,$24,$CE,$61,$0F,$B1,$8F,$68,$44,$2E,$81,$EF,$11,$2F ; 03E0
.db $04,$2A,$8E,$61,$CF,$F1,$8F,$6A,$80,$6E,$01,$0F,$11,$0F,$02,$64 ; 03F0
.db $9F,$90,$9E,$90,$9F,$A8,$44,$9F,$50,$9E,$90,$BF,$04,$0A,$1F,$10 ; 0400
.db $1E,$10,$1F,$0A,$00,$1F,$10,$1E,$10,$1F,$02,$04,$0E,$11,$1F,$10 ; 0410
.db $0E,$08,$04,$0E,$11,$1F,$10,$0E,$04,$0A,$0E,$11,$1F,$10,$0E,$0A ; 0420
.db $00,$0E,$11,$1F,$10,$0E,$02,$04,$0E,$04,$04,$04,$0E,$08,$04,$0E ; 0430
.db $04,$04,$04,$0E,$04,$0A,$0E,$04,$04,$04,$0E,$0A,$00,$0E,$04,$04 ; 0440
.db $04,$0E,$02,$04,$00,$0C,$04,$04,$0E,$08,$04,$00,$0C,$04,$04,$0E ; 0450
.db $04,$0A,$00,$0C,$04,$04,$0E,$0A,$00,$00,$0C,$04,$04,$0E,$02,$04 ; 0460
.db $0E,$11,$11,$11,$0E,$08,$04,$0E,$11,$11,$11,$0E,$04,$0A,$0E,$11 ; 0470
.db $11,$11,$0E,$0A,$00,$0E,$11,$11,$11,$0E,$02,$04,$00,$0E,$11,$11 ; 0480
.db $0E,$08,$04,$00,$0E,$11,$11,$0E,$04,$0A,$00,$0E,$11,$11,$0E,$0A ; 0490
.db $00,$00,$0E,$11,$11,$0E,$02,$04,$11,$11,$11,$11,$0E ; 04A0

sfont_table:
.db $D5,$36,$C0,$00,$E0,$00,$2C,$01,$40,$0A,$AA,$E0,$40,$0A,$A4,$40 ; 0000
.db $40,$0A,$AE,$A0,$40,$8C,$EC,$80,$40,$00,$00,$00,$D0,$00,$0E,$02 ; 0010
.db $40,$24,$44,$80,$40,$0A,$4A,$00,$40,$00,$EA,$E0,$40,$00,$4E,$40 ; 0020
.db $40,$00,$04,$00,$40,$00,$E4,$44,$40,$72,$16,$00,$D0,$1E,$18,$03 ; 0030
.db $40,$64,$4C,$40,$D0,$06,$02,$04,$40,$C2,$4E,$00,$40,$02,$48,$E0 ; 0040
.db $D0,$0C,$12,$05,$D0,$16,$18,$06,$40,$E4,$40,$00,$D0,$06,$18,$07 ; 0050
.db $E0,$04,$3E,$08,$D0,$18,$06,$09,$40,$06,$00,$00,$40,$E8,$C8,$E0 ; 0060
.db $D0,$08,$04,$0A,$E0,$00,$2E,$0B,$30,$27,$22,$20,$30,$22,$27,$20 ; 0070
.db $10,$00,$00,$00,$20,$22,$20,$20,$40,$AA,$A0,$00,$E0,$14,$3E,$0C ; 0080
.db $E0,$1C,$28,$0D,$40,$A2,$48,$A0,$D0,$08,$14,$0E,$20,$22,$20,$00 ; 0090
.db $30,$24,$44,$20,$30,$42,$22,$40,$E0,$08,$2A,$0F,$40,$04,$E4,$00 ; 00A0
.db $30,$00,$22,$40,$40,$00,$E0,$00,$20,$00,$00,$20,$40,$22,$48,$80 ; 00B0
.db $40,$4A,$AA,$40,$40,$4C,$44,$E0,$40,$C2,$48,$E0,$40,$C2,$42,$C0 ; 00C0
.db $40,$8A,$E2,$20,$40,$E8,$C2,$C0,$40,$68,$EA,$E0,$40,$E2,$48,$80 ; 00D0
.db $40,$EA,$EA,$E0,$40,$EA,$E2,$C0,$20,$02,$02,$00,$30,$02,$02,$40 ; 00E0
.db $40,$24,$84,$20,$40,$0E,$0E,$00,$40,$84,$24,$80,$40,$C2,$40,$40 ; 00F0
.db $E0,$1C,$02,$10,$40,$4A,$EA,$A0,$40,$CA,$CA,$C0,$40,$68,$88,$60 ; 0100
.db $40,$CA,$AA,$C0,$40,$E8,$C8,$E0,$40,$E8,$C8,$80,$40,$68,$AA,$60 ; 0110
.db $40,$AA,$EA,$A0,$40,$E4,$44,$E0,$40,$22,$2A,$E0,$40,$AA,$CA,$A0 ; 0120
.db $40,$88,$88,$E0,$40,$AE,$EA,$A0,$40,$CA,$AA,$A0,$40,$EA,$AA,$E0 ; 0130
.db $40,$CA,$C8,$80,$40,$EA,$AE,$60,$40,$CA,$CA,$A0,$40,$68,$42,$C0 ; 0140
.db $40,$E4,$44,$40,$40,$AA,$AA,$E0,$40,$AA,$A4,$40,$40,$AA,$AE,$A0 ; 0150
.db $40,$AA,$4A,$A0,$40,$AA,$44,$40,$40,$E2,$48,$E0,$40,$4A,$EA,$40 ; 0160
.db $40,$88,$42,$20,$30,$62,$22,$60,$40,$4A,$00,$00,$40,$00,$00,$E0 ; 0170
.db $30,$42,$00,$00,$40,$06,$AA,$60,$40,$8C,$AA,$C0,$40,$06,$88,$60 ; 0180
.db $40,$26,$AA,$60,$40,$04,$AC,$60,$30,$24,$64,$40,$40,$6A,$62,$C0 ; 0190
.db $40,$8C,$AA,$A0,$20,$20,$22,$20,$40,$20,$2A,$40,$40,$88,$AC,$A0 ; 01A0
.db $30,$62,$22,$20,$E0,$00,$34,$11,$40,$0C,$AA,$A0,$40,$04,$AA,$40 ; 01B0
.db $40,$0C,$AC,$80,$40,$06,$A6,$20,$40,$0A,$C8,$80,$30,$06,$42,$60 ; 01C0
.db $30,$46,$44,$20,$40,$0A,$AA,$E0,$40,$0A,$A4,$40,$E0,$00,$22,$12 ; 01D0
.db $40,$0A,$44,$A0,$40,$0A,$A4,$80,$D0,$00,$1E,$13,$40,$64,$84,$60 ; 01E0
.db $20,$22,$22,$20,$40,$C4,$24,$C0,$D0,$00,$0A,$14,$40,$E0,$E0,$E0 ; 01F0
.db $40,$EA,$AA,$E0,$30,$26,$22,$20,$40,$C2,$48,$E0,$40,$C2,$42,$C0 ; 0200
.db $40,$8A,$E2,$20,$40,$E8,$C2,$C0,$40,$68,$EA,$E0,$40,$E2,$48,$80 ; 0210
.db $40,$EA,$EA,$E0,$40,$EA,$E2,$C0,$D2,$04,$0C,$15,$D0,$08,$0C,$16 ; 0220
.db $DC,$12,$0C,$17,$D2,$00,$0C,$18,$D4,$08,$00,$19,$D0,$08,$00,$1A ; 0230
.db $D8,$14,$00,$1B,$D0,$14,$00,$1C,$D0,$0E,$08,$1D,$D2,$1C,$10,$1E ; 0240
.db $44,$A0,$EC,$E0,$4A,$E8,$C8,$E0,$40,$24,$AC,$60,$40,$84,$AC,$60 ; 0250
.db $44,$A4,$AC,$60,$4A,$04,$AC,$60,$42,$4E,$44,$E0,$48,$4E,$44,$E0 ; 0260
.db $44,$AE,$44,$E0,$4A,$0E,$44,$E0,$42,$40,$C4,$E0,$48,$40,$C4,$E0 ; 0270
.db $44,$A0,$C4,$E0,$40,$A0,$C4,$E0,$E4,$08,$1C,$1F,$E0,$08,$1C,$20 ; 0280
.db $E8,$14,$1C,$21,$E4,$00,$1C,$22,$E4,$08,$00,$23,$E0,$08,$00,$24 ; 0290
.db $E8,$14,$00,$25,$E0,$14,$00,$26,$42,$4A,$AA,$E0,$48,$4A,$AA,$E0 ; 02A0
.db $44,$A0,$AA,$E0,$4A,$0A,$AA,$E0,$D4,$08,$00,$27,$D0,$08,$00,$28 ; 02B0
.db $D8,$14,$00,$29,$D0,$14,$00,$2A,$40,$68,$86,$C0,$40,$06,$86,$C0 ; 02C0
.db $DA,$14,$12,$2B,$DA,$14,$00,$2C,$30,$24,$00,$00,$30,$42,$00,$00 ; 02D0
.db $40,$A0,$00,$00,$40,$40,$48,$60,$20,$20,$22,$20,$D0,$00,$0A,$2D ; 02E0
.db $40,$4A,$CA,$C0,$D0,$02,$0A,$2E,$E0,$00,$08,$2F,$40,$48,$4A,$40 ; 02F0
.db $40,$68,$E8,$60,$30,$64,$44,$60,$40,$84,$4A,$A0,$D0,$00,$14,$30 ; 0300
.db $E0,$00,$3E,$31,$D0,$04,$0A,$32,$D0,$1E,$08,$33,$D0,$00,$0E,$34 ; 0310
.db $D0,$00,$1C,$35,$E0,$08,$1C,$36,$E0,$1C,$22,$37,$40,$E0,$A4,$A0 ; 0320
.db $40,$E0,$A4,$80,$40,$A4,$A0,$00,$30,$00,$00,$70,$40,$26,$E6,$20 ; 0330
.db $30,$06,$60,$00,$40,$22,$48,$80,$30,$00,$60,$00,$40,$C2,$4E,$00 ; 0340
.db $40,$4A,$40,$00,$40,$E4,$2C,$00,$00,$00,$00,$00,$40,$80,$8A,$C0 ; 0350
.db $40,$4C,$AC,$80,$40,$8A,$4A,$20,$40,$E8,$E8,$80,$40,$04,$AC,$60 ; 0360
.db $30,$04,$44,$70,$30,$65,$55,$50,$40,$A5,$55,$5A,$30,$64,$64,$60 ; 0370
.db $30,$27,$77,$20,$E0,$20,$21,$38,$D0,$02,$00,$39,$E0,$20,$23,$3A ; 0380
.db $D4,$0A,$11,$3B,$EF,$29,$39,$3C,$D8,$09,$0F,$3D,$EE,$0A,$0B,$3E ; 0390
.db $D0,$00,$10,$3F,$EE,$2A,$3B,$40,$D0,$10,$15,$41,$E0,$20,$21,$42 ; 03A0
.db $D6,$08,$10,$43,$20,$00,$00,$00,$30,$00,$00,$00,$D0,$00,$00,$44 ; 03B0
.db $E0,$00,$00,$45,$40,$A4,$A4,$A0,$E0,$1C,$28,$46,$D0,$04,$0E,$47 ; 03C0
.db $D0,$0C,$12,$48,$10,$00,$00,$00,$10,$00,$00,$00,$10,$00,$00,$00 ; 03D0
.db $10,$00,$00,$00,$10,$00,$00,$00,$10,$00,$00,$00,$10,$00,$00,$00 ; 03E0
.db $10,$00,$00,$00,$10,$00,$00,$00,$10,$00,$00,$00,$10,$00,$00,$00 ; 03F0
.db $5D,$BE,$00,$12,$12,$24,$1F,$0E,$04,$1E,$18,$18,$1A,$02,$00,$12 ; 0400
.db $0C,$00,$10,$10,$00,$06,$00,$1E,$08,$3E,$10,$18,$00,$1E,$1E,$04 ; 0410
.db $08,$2A,$2A,$2E,$14,$3E,$14,$1C,$0A,$3C,$08,$14,$0A,$1C,$2A,$08 ; 0420
.db $1A,$2A,$1C,$2A,$2A,$22,$2A,$2A,$14,$04,$08,$1E,$14,$00,$00,$12 ; 0430
.db $1E,$12,$12,$1E,$12,$12,$1E,$12,$12,$1E,$12,$0C,$14,$0A,$0C,$14 ; 0440
.db $0A,$0C,$14,$0A,$0C,$14,$0A,$0C,$08,$0E,$18,$10,$1C,$22,$22,$1C ; 0450
.db $22,$22,$1C,$22,$22,$1C,$22,$22,$1C,$1C,$22,$1C,$1C,$22,$1C,$1C ; 0460
.db $22,$1C,$1C,$22,$1C,$14,$14,$0A,$14,$14,$0A,$14,$14,$0A,$14,$14 ; 0470
.db $0A,$1A,$16,$12,$1C,$12,$12,$14,$14,$0A,$14,$04,$04,$14,$22,$3E ; 0480
.db $14,$1E,$10,$14,$14,$14,$0C,$08,$10,$04,$08,$1E,$14,$14,$08,$08 ; 0490
.db $0A,$04,$2A,$1C,$08,$22,$14,$36,$E4,$E8,$E0,$C8,$C0,$40,$E4,$E8 ; 04A0
.db $F0,$C0,$C0,$40,$E9,$CF,$C0,$C9,$D8,$40,$CA,$FA,$EA,$DC,$D7,$55 ; 04B0
.db $EA,$CE,$C0,$D0,$C0,$40,$E6,$E8,$E0,$C0,$C0,$40,$00,$00,$00,$00 ; 04C0
.db $00,$00,$1C,$0A,$3C,$1F,$0E,$00,$14,$12,$14 ; 04D0





