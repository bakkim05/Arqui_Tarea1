		MOV		R4, #0x500		; Inicializacion de R4

		; Escribir el nombre
		
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



		;Empieza Algoritmo de Encripcion
		
		MOV		R4, #0x500		;Posicion inicial del nombre
		MOV		R5, #0x530		;Posicion final del nombre
		ADD		R5, R5, #4		
		MOV		R12, #0x620		;Posicion inicial de la encripcion
COMP		CMP		R4, R5			;Condicion de parada
		BGE		FINITO
		
		LDR		R6, [R4]			;Carga valor de R4 en R6
		ADD		R6, R6, #23		;Suma 23d al valor en la posicion de memoria R4 mostrada en R6



		;LSFR
		
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

		
		
		STR		R2, [R12]				;Guarda valor encriptado
		ADD		R12, R12, #4			;Siguiente posicion
		ADD		R4, R4, #4			;Siguiente posicion
		
		B		COMP

		
FINITO	END
		
		
