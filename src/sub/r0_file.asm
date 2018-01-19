.ASSUME ADL=0

#define ADJPTR(x) LD HL,(x&$FFFF) \ OR A \ SBC HL,DE \ JR C,$+9 \ JR Z,$+7 \ ADD HL,DE \ ADD HL,BC \ LD (x&$FFFF),HL



;in:   BC=bytes to insert, DE = start pointer (inclusive)
;note: Inserts starting at the end of memory going upwards, for
;      adding VAT and operator stack entries. Does not update pointers.
_insert_at_end:
	LD HL,(OPS&$FFFF)
	CALL CpHLDE&$FFFF ;MIN-CUR. DON'T ALLOW INSERT IF NC (EQ/LT)
	RET NC
	PUSH HL
		EX DE,HL   ;HL=STR, DE=END
		OR A
		SBC HL,DE  ;DIST = STR-END
		EX (SP),HL ;STORE DIST, GET END BACK
		INC HL     ;RPTR = END+1
		LD E,L
		LD D,H     ;HL = DE = RPTR
		SBC HL,BC  ;WPTR = RPTR - MOV
		EX DE,HL   ;HL=RPTR, DE=WPTR
	POP BC
	LDIR
	RET
	
;in:  BC= bytes to insert, DE= start pointer (inclusive)
_insert_at_start:
	LD HL,(FPS&$FFFF)
	CALL CpHLDE&$FFFF   ;MAX-CUR. IF Z OR C, DON'T ALLOW INSERT
	RET Z
	RET C
	PUSH HL
		SBC HL,DE  ;DIST = END-STR
		EX (SP),HL ;STORE DIST, GET COPY OF END
		DEC HL     ;RPTR = END-1
		LD E,L
		LD D,H     ;DE = HL = RPTR
		ADD HL,BC  ;WPTR = RPTR + MOV
		EX DE,HL   ;DE=WPTR, HL=RPTR
	POP BC
	LDDR
	RET
	
	
;in: BC=bytesToDelete, HL=adrToDelFrom
;dst:F,BC,DE,HL. No bounds checking done.
_del_from_end:
	LD DE,(OPS&$FFFF)
	PUSH HL
		OR A
		SBC HL,BC ;RPTR = STR-MOV
		PUSH HL   ;SAVE RPTR
			OR A
			SBC HL,DE  ;DIST = RPTR-END
			EX (SP),HL ;HL=RPTR, (SP)=DIST
		POP BC    ;BC=DIST
	POP DE        ;DE= WPTR= STR
	LDDR
	RET
		
		
	
	
;in: BC=bytesToDelete, HL=adrToDelFrom
;dst:F,BC,DE,HL. No bounds checking done.
_del_from_start:
	LD DE,(FPS&$FFFF)
	PUSH HL
		ADD HL,BC  ;RPTR = STR+MOV
		EX DE,HL   ;HL=END, DE=RPTR
		SBC HL,DE  ;DIST = END-RPTR
		LD B,H
		LD C,L
	POP HL    ;WPTR = STR
	EX DE,HL  ;HL=RPTR, DE=WPTR, BC=DIST
	LDIR
	RET
		
		
;in: HL=bytesToInsert, DE=insertionAdr
;
InsertMem:
	CALL INSERTMEMA&$FFFF ;RETURNS BC=bytesToInsert, DE=insertAddress
	PUSH DE
		DEC DE
		CALL DelVar3DC&$FFFF
	POP DE
	RET


#define ADJPTRSUB(x) LD HL,(x&$FFFF) \ OR A \ SBC HL,DE \ JR C,$+11 \ JR Z,$+9 \ ADD HL,DE \ OR A \ SBC HL,BC \ LD (x&$FFFF),HL
	
;Note: This routine is for inserting memory. It does this by
;negating BC and then calling the adjustment routine for delmem.
;in: HL=bytesToInsert, DE=insertionAdr-1
DelVar3DC:
	CALL _negBC&$FFFF
	JR DELVAR3D
;in: HL=adrToDelFrom, DE=bytesToDel
DelMem:
	CALL DELMEMA&$FFFF
DELVAR3D:
	CALL AdjMath&$FFFF
DELVAR3C:
	CALL ADJPARSER  ;BECAUSE OF COURSE.
	CALL _negBC
	LD HL,(fpBase&$FFFF)
	ADD HL,BC
	LD (fpBase&$FFFF),HL
	LD HL,(FPS&$FFFF)
	ADD HL,BC
	ld (FPS&$FFFF),HL
	LD HL,(tempMem)
	OR A
	SBC HL,DE
	JR C,_ ;If you don't have to modify tempMem, this means we're working with
	JR Z,_ ;a temp variable. Search pTemp only for extra speed.
	ADD HL,DE
	ADD HL,BC
	LD (tempMem),HL
	LD HL,symTable
	JR ++_
_:	LD HL,(pTemp)
_:  CALL IsFixedName
	PUSH AF
		DEC HL
		DEC HL
		DEC HL
		LD A,E
		SUB (HL)  ;CMPR-VATADR (PART1)
		DEC HL
		LD A,D
		SBC A,(HL) ;CMPR-VATADR (PART2)
		JR Z,_dva_scanvat_noupdate
		INC HL
		LD A,C
		ADD A,(HL)
		LD (HL),A
		DEC HL
		LD A,B
		ADC A,(HL)
		LD (HL),A
_dva_scanvat_noupdate:
	POP AF
	LD A,-5
	JR NZ,_
	DEC HL
	DEC HL
	LD A,(HL)
	CPL     ;FAIL TO COMPENSATE FOR NOT USING NEG TO AVOID ANOTHER DEC HL
_:	ADD A,L
	LD L,A
	LD A,H
	ADC A,$FF
	LD H,A
	LD A,(OPBase+0)
	SUB L
	LD A,(OPBase+1)
	SUB H
	RET C
	JR --_


;in: HL=bytesToInsert, DE=insertionAdr
;out:BC=bytesToInsert, DE=insertionAdr
;dest: HL
INSERTMEMA: ;OLD 27, NEW 23
	PUSH DE 
		PUSH HL
			LD BC,(FPS&$FFFF)
			EX DE,HL  ;HL=insAdr, DE=MOV
			SBC HL,BC ;DIST = STR-END
			JR Z,+_   ;ZERO DIST MEANS NOTHING TO MOVE
			DEC BC    ;RPTR = END-1
			PUSH HL   ;SAVE DIST
				LD H,B
				LD L,C ;RPTR TO HL
				ADD HL,DE ;WPTR = RPTR + MOV
			POP BC    ;DIST= BC
			EX DE,HL  ;DE=WPTR, HL=RPTR
			LDDR
_:		POP BC
	POP DE
	RET
	

;in: HL=adrToDelFrom, DE=bytesToDel
;out:DE=adrToDelFrom, BC=bytesToDel
DELMEMA:
	PUSH DE
		PUSH HL
			ADD HL,DE   ;RPTR = STR+MOV. NO CARRY POSSIBLE W/O CRASH
			EX DE,HL    ;DE=RPTR
			LD HL,(FPS&$FFFF) ;HL=END
			SBC HL,DE   ;DIST = END-RPTR
			JR Z,_      ;NO DEL IF AT END.
			LD B,H
			LD C,L      ;BC=DIST
			POP HL
			PUSH HL     ;HL=WPTR=STR
			EX DE,HL    ;DE=WPTR, HL=RPTR
			LDIR
_:		POP DE
	POP BC
	RET
	
	
;DE = insertion/deletion point, BC= amount to subtract from pointer
;Note: This won't adjust pointers if you're trying to edit INSIDE
;      of a currently running BASIC program. No use for it?
ADJPARSER:
	LD HL,(basic_start&$FFFF)    ;basic_start
	OR A
	SBC HL,DE
	RET C
	RET Z
	ADD HL,DE
	SBC HL,BC
	LD (basic_start&$FFFF),HL
	LD HL,(basic_pc&$FFFF)
	OR A
	SBC HL,BC
	LD (basic_pc&$FFFF),HL
	LD HL,(basic_end&$FFFF)
	OR A
	SBC HL,BC
	LD (basic_end&$FFFF),HL
	RET
	
;DE = insertion/deletion point, BC= amount to subtract from pointer
AdjMath:
	PUSH BC
		CALL _negBC&$FFFF
		ADJPTR(iMathPtr1&$FFFF)	;84D3
		ADJPTR(iMathPtr2&$FFFF)	;84D5
		ADJPTR(iMathPtr3&$FFFF)	;84D7
		ADJPTR(iMathPtr4&$FFFF)	;84D9
		ADJPTR(iMathPtr5&$FFFF)	;84DB
		JR _
ADJM7:
	PUSH BC
		CALL _negBC&$FFFF
_:
		ADJPTR(chkDelPtr1&$FFFF)    ;84DD
		ADJPTR(chkDelPtr2&$FFFF)    ;84DF
		ADJPTR(insDelPtr&$FFFF)     ;84E1
		ADJPTR(fOutDat&$FFFF)       ;84E5
		ADJPTR($84E7)               ;unknown - immediately after fOutDat
		ADJPTR(asm_data_ptr1&$FFFF) ;84EB
		ADJPTR(asm_data_ptr2&$FFFF) ;84ED
		ADJPTR(XOutDat&$FFFF)       ;918E
		ADJPTR(YOutDat&$FFFF)       ;9192
		ADJPTR(inputDat&$FFFF)      ;9196
		ADJPTR($9302)               ;unknown
		ADJPTR($9306)               ;unknown
		ADJPTR($9311)               ;unknown
		ADJPTR($9313)               ;unknown
		ADJPTR(editDat&$FFFF)       ;9708
		ADJPTR(fmtMatMem&$FFFF)     ;980A
		ADJPTR(EQS&$FFFF)           ;980C
		ADJPTR(newDataPtr&$FFFF)    ;9832
	POP BC
	RET
	
	

;in: HL = Start of VAT entry of variable to check
;out:NZ if object has a fixed length name.
IsFixedName:
	LD A,(HL)
	AND $1F
	CALL _CheckAllNamedTypes
	RET Z
	CALL IS_A_LSTorCLST
	RET NZ
	PUSH HL
		CALL _HLMinus6
		LD A,(HL)
	POP HL
	CP $72
	JR Z,_
	CP $3A
	JR Z,_
	CP $24
	JR Z,_
	XOR A
	RET
_:	INC A
	RET
	
	
	
	
	
IS_A_LSTorCLST:
	CP $01
	RET Z
	CP $0D
	RET
	
_CheckAllNamedTypes:
	CP $15 \ RET Z
	CP $17 \ RET Z
	;
	CP $05 \ RET Z
	CP $06 \ RET Z
	CP $16 \ RET
	

;--------------------------------------------------------------------		

	
_negBC:
	LD A,C \ CPL \ LD C,A
	LD A,B \ CPL \ LD B,A
	INC BC
	RET



_cpHLindDE:
	PUSH HL
		LD HL,(HL)
		OR A
		SBC HL,DE
	POP HL
	RET
		
