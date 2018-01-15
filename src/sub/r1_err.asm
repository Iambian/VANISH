.ASSUME ADL=1

errnosupport:
	CALL.SIS OffpageRestoreHardware&$FFFF
	CALL DispErrStart
	LD HL,_errnosupp_str
	CALL PutSInternal
	LD HL,(r0syscalldata)
	CALL DispHLHex
	JR errorcommon
_errnosupp_str:
    ;0123456789012345
.db "System call not "
.db "supported: ",0
	
errorcommon:
	CALL updateScreen
	CALL waitAnyKey
	JP execExit
	
errnonmi:
	CALL DispErrStart
	LD HL,_errnonmi_str
	CALL PutSInternal
	JR errorcommon
_errnonmi_str:
    ;0123456789012345
.db "Illegal memory  "
.db "or I/O access.  ",0

errtrap:
	CALL DispErrStart
	LD HL,_errtrap_str
	CALL PutSInternal
	JR errorcommon
_errtrap_str:
    ;0123456789012345
.db "TRAP or rst 00h ",0

DispErrStart:
	PUSH HL
		LD HL,_err_palette
		CALL SetColorPalette
		CALL ClrScrnFull
		CALL HomeUp
		LD HL,_disperrstart_str
		CALL PutSInternal
	POP HL
	RET
_err_palette:
.dw %0011110000000000,$FFFF
_disperrstart_str:
    ;0123456789012345
.db "A fatal error   "
.db "has occurred:   ",0

