.ASSUME ADL=1

;group pre-increment
;key post-increment
getscancode:
	CALL scankbd
	PUSH HL
		PUSH BC
			LD HL,$F5001E
			LD B,H  ;let B be the group counter
			LD C,H  ;let C be the key counter
_gsc_mainloop:
			LD A,(HL)
			OR A
			JR Z,_gsc_nextrow
			INC C
			DEC C
			JR NZ,_gsc_reject_keypress  ;FAT FINGERS ON ANOTHER ROW? REJECT.
_:			INC C
			ADD A,A
			JR NC,-_  ;LOOP UNTIL A 1 BIT IS FOUND.
			JR NZ,_gsc_reject_keypress  ;PRVENT SUPER FAT FINGER PROBLEMS
_gsc_nextrow:
			INC B
			DEC L
			DEC L
			LD A,L
			CP A,$10
			JR NZ,_gsc_mainloop
			LD A,B  ;GET GROUP
			ADD A,A
			ADD A,A
			ADD A,A ;Row*8
			ADD A,C ;+col
		POP BC
	POP HL
	RET
_gsc_reject_keypress:
			XOR A
		POP BC
	POP HL
	RET
	
;Compatibility/convenience routine for 83+ programs.
;g1E: %11111110, g1C: %11111101, g1A: %11111011, etc.
;Bitfields are the same but inversed.

getDirectInput:
	CALL scankbd
	PUSH HL
		PUSH BC
			LD HL,$F5001E
			LD B,7
			LD C,A
			XOR A
_gdinp_loop	SRL C
			JR C,_gdinp_skipscan
			OR A,(HL)
_gdinp_skipscan:
			DEC L
			DEC L
			DJNZ  _gdinp_loop
			CPL  ;INVERT BITS AS REQUIRED BY PRIOR HARDWARE
		POP BC
	POP HL
	RET

scankbd:
	PUSH HL
		LD HL,$F50000
		LD (HL),2     ;SINGLE SCAN
		XOR A
_:		CP A,(HL)
		JR NZ,-_     ;WAIT UNTIL KEYBOARD RETURNS TO IDLE MODE
	POP HL
	RET

waitAnyKey:
	CALL keyWait
_:	XOR A
	CALL getDirectInput
	INC A
	JR NZ,-_    ;LOOP UNTIL YOU STOP PRESSING A KEY
keyWait:
	XOR A
	CALL getDirectInput
	INC A
	JR Z,keyWait  ;KEEP LOOPING UNTIL A KEY IS PRESSED
	RET
	
	








