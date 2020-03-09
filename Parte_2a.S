		MOV		R4, #0x500
		
		MOV		R0, #0x63			;C
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x6C			;L
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x61			;A
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x75			;U
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x64			;D
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x65			;E
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x73			;S
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x68			;H
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x61			;A
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x6E			;N
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x6E			;N
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x6F			;O
		STR		R0, [R4]
		ADD		R4, R4, #4
		
		MOV		R0, #0x6E			;N
		STR		R0, [R4]
		ADD		R4, R4, #4


		
		
		MOV		R4, #0x500
		MOV		R5, #0x530
		ADD		R5, R5, #4
		MOV		R12, #0x620
COMP		CMP		R4, R5
		BGE		FINITO
		
		LDR		R6, [R4]
		ADD		R6, R6, #23
		
		MOV		R0, R6
		MOV		R1, #1
		MOV		R2, R0
		
		AND		R10, R0, R1			;primer digito
		
		LSR		R0, R0, #2
		AND		R9, R0, R1			;segundo digito
		EOR		R10, R10, R9			;primer XOR
		
		LSR		R0, R0, #1
		AND		R9, R0, R1			;tercer digito
		EOR		R10, R10, R9			;segundo XOR
		
		LSR		R0, R0, #1
		AND		R9, R0, R1			;cuarto digito
		EOR		R10, R10, R9			;tercer XOR
		
		LSL		R10, R10, #7
		LSR		R2, R2, #1
		ADD		R2, R2, R10
		
		STR		R2, [R12]
		ADD		R12, R12, #4
		ADD		R4, R4, #4
		
		B		COMP

		
FINITO	END
		
		
