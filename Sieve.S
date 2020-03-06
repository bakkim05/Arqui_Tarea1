		MOV		R0, #15		;Numero Final
		MOV		R7, #0x700	;Posicion de Memoria Inicial
		MOV		R1, #1		;Numero Inicial
		STR		R1, [R7]		;Guadar en memoria el numero en R1
		ADD		R7, R7, #4	;Siguiente direccion de memoria
		ADD		R1, R1, #1
		
SET1		CMP		R0, R1		;Comparacion de R0 == R1
		BNE		GEN			;Genera hasta el numero final en direcciones de memoria
		STR		R1, [R7]		;Agrega el ultimo numero
		B		SET2			;Algoritmo de Primos
		
GEN		STR		R1, [R7]		;Agrega numero de posicion de memoria actual
		ADD		R7, R7, #4	;Siguiente direccion de memoria
		ADD		R1, R1, #1	;Siguiente Numero
		B		SET1			;Comparacion condicion de parada
		
		
		
		
		
SET2		MOV		R6, #0x700	;Inicializar R6 (posicion actual)
		MOV		R10, #0		;R10 = 0
		MOV		R11, #1		;R11 = 1
sigPos	ADD		R6, R6, #4	;Saltar a siguiente posicion (primera ejecucion: salta a 2)
		
		MOV		R5, R6		;Inicializar R5 (posicion temporal)
CICLO	CMP		R6, R7		;Posicion Actual vs. Posicion Final
		BLE		FOO			;Loop: Posicion Actual < Posicion Final
		END
		
		
		
FOO		LDR		R8, [R5]		;Poner en R8 el valor de R5 (posicion temporal)
		CMP		R8, #0		;Valor en pos temporal vs. 0
		BNE		NO0
		B		sigPos
		
		
		
NO0		B		MUL
rtnMUL	STR		R11, [R6]		;Poner en pos mem R6 valor 1
		ADD		R5, R5, R2	;Salta al siguiente multiplo del numero en R6
ciclo0	CMP		R5, R7		;Mem Temp Vs. Mem Final
		BGT		sigPos
		STR		R10, [R5]		;Poner en pos meme R5 valor 0
		ADD		R5, R5, R2	;Salta al siguiente multiplo del numero en R6
		B		ciclo0
		
		
		
		
ES0		ADD		R6, R6, #4
		MOV		R5, R6
		B		FOO
		
		
		;MULTIPLICACION;
MUL		MOV		R0, #4	;Valor a Multiplicar
		MOV		R1, R8	;Cantidad de Veces
		MOV		R2, #0	;Respuesta
		
compMUL	CMP		R1, #0
		BNE		cicloMUL
		B		rtnMUL
		
		
cicloMUL	ADD		R2,R2,R0
		SUB		R1, R1, #1
		B		compMUL
		
