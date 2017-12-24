.ASSUME ADL=0

bcall_routine:     		 ;-12 RETURN ADDRESS
	PUSH HL				 ;-10  RET TO LOCAL BCALL COLLECTOR
	PUSH HL   	     	 ;-8   RET TO CALLED LOCAL ROUTINE
	PUSH AF     	     ;-6
		PUSH DE			 ;-4
			PUSH HL      ;-2
				PUSH IX  ;-0
					LD IX,0
					ADD IX,SP
					LD HL,(IX-12)  ;GET RETURN ADDRESS
					LD DE,(HL)
					INC HL
					INC HL
					LD (IX-14),HL
					RL D
					JR C,bcall_sbase_boot
					JP M,bcall_sbase_os
bcall_sbase_app:	LD HL,$4000
					JR bcall_sbase_collect
bcall_sbase_boot:	LD HL,bcall_table_boot-$8000
					JR bcall_sbase_collect
bcall_sbase_os:		LD HL,bcall_table_os-$4000
bcall_sbase_collect RR D
					ADD HL,DE
					EX DE,HL
					LD DE,(HL)
					INC HL
					INC HL
					LD A,(HL)  ;IF HIGH BYTE NONZERO, THIS ADL CALL
					OR A
					JR NZ,bcall_routine_adl
					LD (IX-8),DE
					LD HL,bcall_routine_local_return
					LD (IX-10),HL
				POP IX
			POP HL
		POP DE
	POP AF
	RET
	
bcall_routine_adl:	JP.L bcall_routine_adlc
bcall_routine_adlc: LD HL,bcall_routine_adl_continue
					PUSH HL  ;-3
					PUSH DE  ;-0
					LD IX,0
					ADD IX,SP
					LD (IX+2),A
				POP.S IX
			POP.S HL
		POP.S DE
	POP.S AF
	RET
bcall_routine_adl_continue:
	LD A,($>>16)&$FF
	LD MB,A
	JP.S bcall_routine_adl_return
bcall_routine_adl_return:
	POP HL
	POP HL
bcall_routine_local_return:
	RET
	
	
	
	
	
	
	
