#DEFINE equ .equ
#DEFINE EQU .equ
#define bcall(xxxx)     rst 28h \ .dw xxxx
_VPutMap	EQU 455Eh
_SFont_Len	EQU 4786h
_CreateAppVar	EQU 4E6Ah
_LoadPattern	EQU 4CB1h  ;A=char, fracDrawLFont,(iy+fontFlags): 1=large,0=small
_GrBufClr	EQU 4BD0h
_GrBufCpy	EQU 486Ah
_ChkFindSym	EQU 42F1h
_DelVarArc	EQU 4FC6h
_ClrLCDFull	EQU 4540h
_DispHL		EQU 4507h


lFont_record         EQU  845Ah  ;8 bytes: 1 width, 7 char bytes
sFont_record         EQU  8462h  ;8 bytes: 1 width, 7 char bytes
penCol               EQU  86D7h
penRow               EQU  86D8h
flags                EQU  89F0h
plotSScreen          EQU  9340h
userMem              EQU  9D95h
OP1                  EQU  8478h
OP2                  EQU  8483h
OP3                  EQU  848Eh
OP4                  EQU  8499h
OP5                  EQU  84A4h
OP6                  EQU  84AFh
curRow               EQU  844Bh  ;0-16
curCol               EQU  844Ch  ;0-8

fontFlags	EQU  50
fracDrawLFont	EQU    2
fracTallLFont	EQU    3
customFont	EQU    7  

;rst 20h = mov9toOp1

.org userMem-2
.db $BB,$6D
programStart:
_:	ld hl,dumpfilename
	rst 20h
	bcall(_ChkFindSym)
	jr c,+_  ;skip if variable was not found - it's ready to be (re)created
	bcall(_DelVarArc)
	jr -_
_:	ld hl,4096
	bcall(_CreateAppVar)
	inc de
	inc de
	ld (dumpfileadr),de
	push de
		push de
		pop hl
		inc de
		ld (hl),0
		ld bc,4095
		ldir
	pop de
	ld hl,1342 \ add hl,de ;debug
	ld (hl),$FF \ inc hl   ;debug
	ld (hl),$FF \ inc hl   ;debug
	ld (hl),$FF \ inc hl   ;debug
	ld (hl),$FF \ inc hl   ;debug
	call clearBuf
	;lfont notes: All large font characters are 5px wide with a 1px space after
	;fmt: first 171 chars stored %---ccccc 7 bytes apiece. ofst: buf+(7*rA)
	;     last 85 chars stored %210[..] %543[..] [...] ofst: buf+(14*rA)
	;Total size of compacted lfont table is 1190 bytes.
	xor a
_:	set fracDrawLFont,(iy+fontFlags)
	push af
		bcall(_LoadPattern)
		ld hl,lfont_record+1 \ call copyFontToScreen
		; ld bc,4000
		; dec bc
		; ld a,b
		; or c
		; jr nz,$-3
	pop af
	push af
		cp 171  ;if nc, store in slack bits (2 MSBits) (offset=rA*21)
		jr nc,lfont_storeslack
lfont_storebytes:
		ld e,a
		ld h,7
		call multEandH
		ld de,(dumpfileadr)
		add hl,de
		ex de,hl
		ld hl,lfont_record+1
		ld b,7
lfont_storebyte_loop:
		ld a,(hl)
		rrca \ and %00011111
		ld (de),a
		inc hl
		inc de
		djnz lfont_storebyte_loop
		jr lfont_continue
lfont_storeslack:
		sub 171
		ld e,a
		ld h,14
		call multEandH
		ld de,(dumpfileadr)
		add hl,de
		ld de,lfont_record+1
		ld b,7  ;The latter half of last iter will be junk. This is OK.
lfont_storeslack_loop:
		ld a,(de)  ;font record
		inc de
		rrca \ rrca \ rrca
		ld c,a
		xor (hl)   ;write-to
		and %11100000
		xor (hl)
		ld (hl),a
		inc hl
		ld a,c
		rrca \ rrca \ rrca
		ld c,a
		xor (hl)   ;write-to
		and %11100000
		xor (hl)
		ld (hl),a
		inc hl
		djnz lfont_storeslack_loop
lfont_continue:
	pop af
	inc a
	jr nz,-_
	ld hl,gbuf+(12*20)
	ld (copyFontToScreenAddress),hl
	;sfont notes: Stored in two tables.
	;Primary table uses 4 bytes per entry, for all 256 entries.
	;Secondary table uses 3 bytes per entry, has only number of entries needed.
	;If the character is 4 or less pixels wide, only a primary entry will be made
	;of the format (F=0): FWWW0000 11112222 33334444 55556666
	;Otherwise, 6 pixels wide format is used. An extended entry is made on the
	;secondary table and is indexed in the primary entry. Format is as follows:
	;(F=1) PRIM: FWWW0000 __INDEX_ 00111111 --222222 
	;      SECO: SS333333 SS444444 SS555555
	;Where the slack bits are in little-endian format 0: --221100 6: --554433
	;      PRIM: ----1100 -------- 22------ --------
	;      SECO: 33------ 44------ 55------
	;
	;Total size of compacted table is 1024+(72*3) = 1240
	ld hl,(dumpfileadr)
	ld de,1344
	add hl,de
	ld (dumpfileadr),hl
	ld de,(256*4)-3  ;after primary table, less 3 for initial increment
	add hl,de
	ld (secondtableadr),hl
	xor a
_:	res fracDrawLFont,(iy+fontFlags)
	push af
		bcall(_LoadPattern)
		ld hl,sfont_record+1 \ call copyFontToScreen
	pop af
	push af
		ld e,a
		ld h,4
		call multEandH
		ld de,(dumpfileadr)
		add hl,de
		ex de,hl  ;DE = primary table, current entry address
		ld hl,sfont_record
		ld a,(hl)  ;get width
		inc hl
		cp 5
		jr c,sfont_packshort
		set 3,a  ;----FWWW
		rlca \ rlca \ rlca \ rlca ;A: FWWW---- (HL): --221100
		rrd      ;A:FWWW1100 (HL): ------11
		ld (de),a ;ptbl: +0
		inc de
		ld a,(hl) ;(b0)
		inc hl    ;(b1)
		rlca \ rlca  ;A: SS------
		xor (hl)     ;A: **111111
		and %11000000 ;A: **------
		xor (hl)     ;A: SS111111
		ld (de),a ;ptbl: +1
		inc de
		inc hl
		ldi       ;direct copy byte 2 to ptbl+2
		push hl
			ld bc,3
			add hl,bc  ;skip forward to final byte in sfont_record
			ld a,(hl)  ;and get that byte
			ld hl,cursmidx
			inc (hl)
			ldi       ;copy index to ptbl+3
			ld hl,(secondtableadr)
			ld bc,3
			add hl,bc
			ld (secondtableadr),hl
			ex de,hl  ;DE = current secondary table entry
		pop hl
		ld bc,(3*256)+255  ;make sure C is high enough that B will never roll over
sfont_packlong_loop:
		rl (hl)
		rl (hl)
		rrca \ rr (hl)
		rrca \ rr (hl)
		ldi
		djnz sfont_packlong_loop
		jr sfont_continue
sfont_packshort:
		res 3,a  ;----FWWW
		rlca \ rlca \ rlca \ rlca ;A: FWWW---- (HL): ----0000
		rrd      ;A = FWWW0000
		ld (hl),a  ;so LDI can copyback
		ldi        ;copy to ptab+0, go to ptab+1, (b1)
		ld bc,(3*256)+255
sfont_packshort_loop:
		ld a,(hl)  ;(b1)
		inc hl     ;
		rlca \ rlca \ rlca \ rlca ;A=1111----
		rrd    ;A=11112222
		ld (hl),a
		ldi    ;copy (b1:b2) to ptab+1
		djnz sfont_packshort_loop
sfont_continue:
		ld hl,sfont_record+1 \ call copyFontToScreen
	pop af
	inc a
	jp nz,-_
	bcall(_ClrLCDFull)
	ld hl,0
	ld (currow),hl
	ld hl,(cursmidx)
	bcall(_DispHL)
	ret
	
;===========================================================================
;===========================================================================
;===========================================================================

gbuf .equ plotsscreen
clearBuf:
	ld hl,gbuf
	ld de,gbuf+1
	ld bc,767
	ld (hl),$00
	ldir
	ret
copyFontToScreen:  ;hl= raw font record, show screen
	push bc \ push de \ push af
copyFontToScreenAddress .equ $+1
		ld de,gbuf
		ld bc,11
		ld a,7
_:		ldi
		inc bc
		ex de,hl
		add hl,bc
		ex de,hl
		dec a
		jr nz,-_
		ex de,hl
		inc bc
		add hl,bc
		ld (hl),%10101010
		add hl,bc
		ld (hl),%01010101
		;call fastCopy
	pop af \ pop de \ pop bc
	ret
	
fastCopy:
	di
    push hl \ push de \ push af \ push bc
;    call debug.always_display
	ld	a,$80				; 7
	out	($10),a				; 11
	ld	hl,gbuf-12-(-(12*64)+1)		; 10
	ld	a,$20				; 7
	ld	c,a				; 4
	inc	hl				; 6 waste
	dec	hl				; 6 waste
fastCopyAgain:
	ld	b,64				; 7
	inc	c				; 4
	ld	de,-(12*64)+1			; 10
	out	($10),a				; 11
	add	hl,de				; 11
	ld	de,10				; 10
fastCopyLoop:
	add	hl,de				; 11
	inc	hl				; 6 waste
	inc	hl				; 6 waste
	inc	de				; 6
	ld	a,(hl)				; 7
	out	($11),a				; 11
	dec	de				; 6
	djnz	fastCopyLoop			; 13/8
	ld	a,c				; 4
	cp	$2B+1				; 7
	jr	nz,fastCopyAgain		; 10/1
    pop bc  \ pop af  \ pop de  \ pop hl
    ei
	ret					; 10	

;from http://map.grauw.nl/sources/external/z80bits.html
;in:   E=multiplier H=multiplicand
;out:  HL=product
multEandH:
 push bc \ push de
   ld L,0
   ld d,L
   sla h
   jr nc,$+3
   ld L,e
   ld b,7
_multEandHLoop:
   add hl,hl
   jr nc,$+3
   add hl,de
   djnz _multEandHLoop
 pop de \ pop bc
 ret

	









dumpfilename:
.db $15,"FDUMPDAT",0
dumpfileadr:
.dw 0
secondtableadr:
.dw 0
cursmidx:
.db -1  ;pre-decremented
.db 0

.echo "Size of FONTDUMP program: ",$-programStart+2
