	SECTION .data

var1:	DB	7Fh					; 0111111
var2:	DB	40H					; 0100000	

	SECTION .text

  global _start

  _start:

	xor 	eax,eax				; inicializa com xor
	mov 	eax,[var1]			; move valor de var1 para eax
	sub 	eax,[var2]			; subtrai de eax o valor de var2

	;xor 	eax,eax				; inicializa com xor			eax = 0
	;mov 	eax,[var1]			; escreve o valor de var1 em eax  	eax = 63
	;and	eax,[var2]			; op. logica AND			63 & 32
	;dec	eax					; eax--					eax -1
	
	
	mov	ebx,eax					; move eax para eax para retornar o valor para o kernel

	mov 		eax,1			; eax = 1, comando de saida para o kernel
	int		0x80				; chama interrupcao - fim do programa

