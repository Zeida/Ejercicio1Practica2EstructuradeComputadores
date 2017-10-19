.global _start
_start:

movia r2, 0x10000000 					// Numero con la direccion del registro de la interfaz
					 					// (en DE2: LEDS) mapeado en memoria
					 					// red led parallel port
INI: 	
		ldw r3, ROJOPAR(r0) 			// Carga en r3 la direccion 0x2AAAA
		stwio r3, 0(r2) 				// Guarda lo que hay en r3 en la direccion 0+r2= 0x10000000, es decir, la direccion del led
		movia r4, 500000 				// Guarda 500000 en R4
		//retardo temporal
DELAY1:
		subi r4, r4, 1  				// resta 1 a 500000
		bne r4, r0, DELAY1 				// si r0 =/ r4 salta a delay1, cuando r4=r0 sigue el programa

		ldw r3, ROJOIMPAR(r0) 			// Carga en r3 la direccion 0x15555
		stwio r3, 0(r2)		 			// Guarda 0x15555 en 0+r2= 0x10000000, es decir en el led == stw pero perifericos E/S con cache

		movia r4, 500000 				//Guarda 500000 en r4
		//retardo temporal
DELAY2:
		subi r4, r4, 1 					//Le resta 1 a 500000
		bne r4, r0, DELAY2 				//salta a DELAY 2 si r4=/ de r0
		br INI 							//Salta A INI


.org 0x200 
ROJOIMPAR: .word 0x15555 
ROJOPAR: .word 0x2AAAA
.end