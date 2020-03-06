MUL		MOV		R0, #10	;Valor Inicial
		MOV		R1, #3	;Cantidad de Veces
		MOV		R2, #0	;Respuesta
COMP		CMP		R1, #0
		BNE		CICLO
		END
		
CICLO	ADD		R2,R2,R0
		SUB		R1, R1, #1
		B		COMP
