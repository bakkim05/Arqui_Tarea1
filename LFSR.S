		
		
		MOV		R0, #107
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
		
