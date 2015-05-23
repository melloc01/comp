	SECTION .data

var1:	DB	7Fh	; 01111111 127
var2:	DB	80H	; 10000000 128

	SECTION .text

  global _start

  _start:
	
	mov 	eax,[var2]	; eax = [var2]
	sub 	eax,[var1]	; eax = eax - [var1]
	
	;mov	eax,[var1]	; eax = [var1]
	;sub	eax,[var2]	; eax = eax - [var2]

	
	mov	ebx,eax		; move eax para eax para retornar o valor para o kernel

	mov 		eax,1	; eax = 1, comando de saida para o kernel
	int		0x80	; chama interrupcao - fim do programa

