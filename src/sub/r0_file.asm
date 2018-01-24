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


;#define ADJPTRSUB(x) LD HL,(x&$FFFF) \ OR A \ SBC HL,DE \ JR C,$+11 \ JR Z,$+9 \ ADD HL,DE \ OR A \ SBC HL,BC \ LD (x&$FFFF),HL



;Okay. This is one of the big ones. First it checks if B is something
;other than zero, then long jumps someplace (25B7). Otherwise it falls into
;DelVarNoArc, then DELVARIO. If type has bit 6 set, invalidate graph flags
;since the variable was being used in graphing or table generation.
;Preserves AF (vartype/flags), sets BC to 9 (fixed VAT entry size) 
;Also preserves DE, then calls IsFixedName if name belongs in symtable.
;If it's a fixed-length name, jump ahead to (2018). Otherwise...
;Check if var is any list types. IF not, jump ahead (200D)
;Restore DE [data location] preserves HL just for: CALL GET_FORM_NUM
;If var was a temp type, returns A=0. If so, jump to 200C.
;Else restore AF->BC [data type], preserve AF (name size field?)
;Performs a some sort of delmem at HL [CALL 200B], sets DE to $9315
;(somewhere between P3FrqOnOff and plotSScreen) then calls $116F to preserve
;OP1 to memory location $9315
;
;
;
;in:  HL=VatAdr,DE=DataAdr,B=[ifInFlash?page:0]
;out: holy shit.
DelVar:	
	INC B
	DEC B
	;JP NZ,DELVARARC_JUMPTO_PLACEHOLDER
DelVarNoArc:
	LD A,(HL)   ;GET TYPE BYTE
DELVARIO:
	BIT 6,A
	CALL NZ,SetTblGraphDraw&$FFFF
	
	
	
	
	
	
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
	CALL ADJPARSER&$FFFF  ;BECAUSE OF COURSE.
	CALL _negBC&$FFFF
	LD HL,(fpBase&$FFFF)
	ADD HL,BC
	LD (fpBase&$FFFF),HL
	LD HL,(FPS&$FFFF)
	ADD HL,BC
	ld (FPS&$FFFF),HL
	LD HL,(tempMem&$FFFF)
	OR A
	SBC HL,DE
	JR C,_ ;If you don't have to modify tempMem, this means we're working with
	JR Z,_ ;a temp variable. Search pTemp only for extra speed.
	ADD HL,DE
	ADD HL,BC
	LD (tempMem&$FFFF),HL
	LD HL,symTable&$FFFF
	JR ++_
_:	LD HL,(pTemp&$FFFF)
_:  CALL IsFixedName&$FFFF
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
	LD A,((OPBase+0)&$FFFF)  ;END-CUR. If CUR<=END, quit. Means quit on NC
	SUB L
	LD A,((OPBase+1)&$FFFF)
	SBC A,H
	RET NC
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
;dst:A
IsFixedName:
	LD A,(HL)
	AND $1F
	CALL _CheckAllNamedTypes&$FFFF
	RET Z
	CALL IS_A_LSTorCLST&$FFFF
	RET NZ
	PUSH HL
		CALL _HLMinus6&$FFFF
		LD A,(HL)
	POP HL
	CP $72
	JR Z,_
	CP $3A
	JR Z,_
	CP $24  ;temp var name
	JR Z,_
	XOR A
	RET
_:	INC A
	RET
	
;in:  HL=Address of name to compare against (not include type byte)
;out: A = Length of variable name
;notes: preserves HL, destroys D,BC. Original also destroyed E.
CMPPRGNAMLEN1:
	PUSH HL
		JR _
;in:  OP1+1 = Name of variable [Op1 is var type]
;out: A = Length of variable name
;dest: D,BC
CMPPRGNAMLEN:
	PUSH HL
		LD HL,(OP1+1)&$FFFF
_:		LD A,(HL)
		SUB $5D-1
		LD D,A
		LD BC,9
		XOR A
		CPIR
	POP HL
	LD A,8
	SUB C
	CP 1
	RET NZ  ;SKIP SINGLE CHR CHECK
	INC D
	RET NZ  ;SKIP LIST 2BYTE CHECK
	INC A
	RET
	
	
;in:   HL=StartOfVATEntry
;out:  A=formula number, or 0 if object doesn't have a formula.
;dest: HL,BC
;note: Temporary variables ($24) cannot have a formula. This is checked for by
;      Seeing if the first byte of a fixed size name is '$' (024h). Otherwise,
;      the formula ID is the last byte of a file's name. The name is always
;      a variable (non-fixed) length name.
GET_FORM_NUM: ;1F5C
	CALL _HLMinus6&$FFFF
	LD A,(HL)
	CP $24
	JR NZ,_
	XOR A
	RET
_:	LD B,0
	LD C,A
	OR A
	SBC HL,BC
	LD A,(HL)
	RET
	


	
;in: A=VarType, HL=Size, OP1+1= Name of file to create
CreateVar:
	
		
	
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
	
	
;Preserve HL and AF.
;Fetches pTempCnt and shoves it into OP1M (OP1+2), then increments this value.
;Check to see if it goes over 64K and throw err:mem at it. SAFE TO OMIT THIS.
;Write $24 to Op1+1 ('$'), then run FindSym on the result.
;If object was not found, restore HL and AF, do "OR A" and return.
;If it was found, it seems to be trying to re-use it? In that case...
;HL = VAT entry, DE = data entry
;Reset bit 7 of (HL) [Data type byte, flag bit probably indicating "dirty"]
;exch HL and DE to put file data ptr into HL. A is still type.
;Save preserved HL (data address) to insDelPtr. DE is the size in bytes.
;Restore registers: AF = type, BC = RequestedVariableSize
;Preserve: AF,BC=ReqVarSize,DE=FoundVarSizeBytes,HL=DataAddress
;Call DataSizeA returns requestedVarSize in DE, Restore FoundVarSize in HL.
;FoundVarSize - RequestedVarSize. If zero, goto A. NC, goto B. Else keep going.
;Undo the subtraction, flip HL and DE and subtract again:
;RequestedVarSize - FoundVarSize
;
;
;
;
;
CREATETEMP:
	
	
	
FindSym:
	
	
	
;In:   BC= VariableSizeField, A=VarType (pre-masked. This might be a bug?)
;out:  DE= size in bytes in data area, including size field
;dest: A,BC [preserves HL]
;Note: Assumes that the input type is not real/cplx. Does not check for that.
DataSizeA:
	LD D,B
	LD E,C
	JR _datasize_breakin

;In:   HL=ptrToVariableStart, A=VarType
;out:  DE= size in bytes in data area, including size field
;dest: A,BC [preserves HL]
DataSize:
	;todo: finish this.
	LD DE,9
	AND $1F  ;MASK OUT AND CHECK FOR REAL TYPE
	RET Z
	LD DE,18
	CP CplxObj
	RET Z
	LD E,(HL)
	INC HL
	LD D,(HL)
	DEC HL
_datasize_breakin:
	PUSH HL
		EX DE,HL
		DEC A   ;ListObj
		JR Z,_datasize_mult9
		DEC A   ;MatObj
		JR Z,_datasize_matr
		CP CListObj-2
		JR NZ,_datasize_passthrough
		ADD HL,HL
		OR A  ;NZ so HtimesL is not called
_datasize_matr:
		CALL Z,HtimesL&$FFFF
_datasize_mult9:
		CALL HLtimes9&$FFFF
		JP C,ErrMemory&$FFFF
_datasize_passthrough:
		LD DE,2
		ADD HL,DE
		JP C,ErrMemory&$FFFF
		EX DE,HL
	POP HL
	OR A
	RET
	
;in:  HL=BytesNeeded
;out: DE=BytesReq, carry set if not enough memory. Also, system error thrown.
ErrNotEnoughMem:
	CALL EnoughMem&$FFFF
	RET NC
	JP ErrMemory&$FFFF
;in:  HL=BytesNeeded
;out: DE=BytesReq, carry set if not enough memory
EnoughMem:
	EX DE,HL
_enm_check_again:
	CALL MemChk&$FFFF  ;My version also clears carry flag
	SBC HL,DE
	RET NC     ;RETURN IF WE HAVE ENOUGH MEMORY. HL IS AMT OF MEM WE HAVE LEFT
	PUSH DE
		LD DE,-9
		LD HL,(pTemp&$FFFF)
		LD BC,(OPBase&$FFFF)
		INC BC
_enm_del_keep_trying:
		OR A
		SBC HL,BC
		JR C,_enm_we_really_tried
		ADD HL,BC
		BIT 7,(HL)
		JR Z,_enm_but_it_wasnt_that_dirty
		PUSH HL
			DEC HL
			DEC HL
			DEC HL
			LD E,(HL)
			DEC HL
			LD D,(HL)
			DEC HL
			LD B,(HL)
		POP HL
		CALL DelVar&$FFFF
	POP DE
	JR _enm_check_again
_enm_but_it_wasnt_that_dirty:
		ADD HL,DE
		JR _enm_del_keep_trying
_enm_we_really_tried:
	POP DE
	RET     ;but_it_just_wasnt_meant_to_be
	
	
;in: N/A
;out:HL=AmtOfRAMAvailable. ENHANCEMENT: CLEARS CARRY FLAG
;dst:HL,BC.
MemChk:
	LD HL,(OPS&$FFFF)
	LD BC,(FPS&$FFFF)
	OR A
	SBC HL,BC
	INC HL
	RET NC
	OR A
	SBC HL,HL
	RET	

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
		
