		;Inicializacion
		
		MOV		R9, #0xF0
		MOV		R11, #0x600
		MOV		R12, R11
		ADD		R12, R12, #4
		STR		R9, [R11]
		MOV		R9, #0xFF
		STR		R9, [R12]
		
		
		MOV		R4, #0x500	;1ST MEM DIR Pseudo RAND
		MOV		R5, #0x540
		ADD		R5, R5, #4	;LAST MEM DIR Pseudo RAND
		MOV		R6, #107		;HIGHEST NUMBER
		MOV		R0, #107		;LAST NAME KEY
		STR		R0, [R4]
LSFR0	CMP		R4, R5
		BLT		LSFR1
		B		SIEVE
		
		
		
		;LSFR
		
LSFR1	LDR		R7, [R4]
		MOV		R0, R7
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
		
		ADD		R4, R4, #4
		STR		R2, [R4]
		
		CMP		R2, R6
		BGT		grande
		B		LSFR0
		
		
grande	MOV		R6, R2
		B		LSFR0
		
		
		
		
		
		
		
		
		
		
		
		
		
		;Calculo de Primos
		
SIEVE	MOV		R0, R6		;Numero Final
		MOV		R7, #0x800	;Posicion de Memoria Inicial
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
		
		
		
		
		
SET2		MOV		R6, #0x800	;Inicializar R6 (posicion actual)
		MOV		R10, #0		;R10 = 0
		MOV		R11, #1		;R11 = 1
sigPos	ADD		R6, R6, #4	;Saltar a siguiente posicion (primera ejecucion: salta a 2)
		
		MOV		R5, R6		;Inicializar R5 (posicion temporal)
CICLO	CMP		R6, R7		;Posicion Actual vs. Posicion Final
		BLE		FOO			;Loop: Posicion Actual < Posicion Final
		B		FINDER
		
		
		
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
		
		
		
		
ES0		ADD		R6, R6, #4	;Si es cero se va a la siguiente direccion de R6
		MOV		R5, R6		;Mueve a R5 en la misma direccion que R6
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
		
		

		;Evaluacion de Pseudo Aleatorios Primos
		
FINDER	MOV		R6, #0x700		;Mueve a R6 donde se van a colocar los valores finales de los primos
		MOV		R5, #0x500		;Mueve a R5 donde estan colocados los numeros pseudo-alazares
		MOV		R12, #0x740		;Mueve a R12 a la posicion final de memoria que ocuparia los primos evaluados
		ADD		R12, R12, #0xC		
		
LOOP1	CMP		R6, R12			;Revisa si ya llego al primo final
		BGT		FINALE
		
		
		MOV		R7, #0x800		;Mover a R7 a la base del listado de primos evaluados
		MOV		R8, #0			;Inicializa R8
		LDR		R8, [R5]			;Ingrea a R8 el valor de la direccion de memoria en R5
		B		MUL2
		
rtnMUL2	ADD		R7, R7, R2		;Se mueve a la direccion de memoria de la evaluacion del primo
		LDR		R9, [R7]			;Se extrae el valor de la evaluacion del primo
		STR		R9, [R6]			;Se guarda el valor a la posicion de memoria de los primos evaluados
		
		ADD		R6, R6, #4		;Siguiente posicion de R6
		ADD		R5, R5, #4		;Siguiente posicion de R5
		B		LOOP1
		
		
		
		
		
		
		;MULTIPLICACION	2;
MUL2		MOV		R0, R8	;Valor a Multiplicar
		MOV		R1, #4	;Cantidad de Veces
		MOV		R2, #0	;Respuesta
		
compMUL2	CMP		R1, #0
		BNE		cicloMUL2
		B		rtnMUL2
		
		
cicloMUL2	ADD		R2,R2,R0
		SUB		R1, R1, #1
		B		compMUL2
		
		
		
		
FINALE	END
