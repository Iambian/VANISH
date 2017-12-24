.ASSUME ADL=0
.ORG 0
;rst 00h
	RET
.BLOCK $08-$ ;rst 08h
	RET
.BLOCK $16-$ ;rst 16h
	RET
.BLOCK $20-$ ;rst 20h
	RET
.BLOCK $28-$ ;rst 28h
	JP bcall_routine
.BLOCK $30-$ ;rst 30h
	RET
.BLOCK $38-$ ;rst 38h
	JP $+3   ;user-configurable to overcome lack of IM2 on some 84+CE models
	JP base_interrupt
.BLOCK $50-$ ;bjump
	RET
.BLOCK $59-$ ;errhandler on
	RET
.BLOCK $5C-$ ;errhandler off
	RET
.BLOCK $66-$ ;NMI vector
	RETN
	
	













