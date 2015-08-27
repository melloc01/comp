	SECTION .data

var16b:		DW	0xFF			; 255
varmask:	DW	0x10			; 16

	SECTION .text

  global _start

  _start:
	
	mov 	ax,[var16b]			; ax = [var16b]
	and	ax,[varmask]			; ax = [varmask]

	not	ax						; convertendo para complemento de 2
	inc	ax						; convertendo para complemento de 2

	;mov 	ax,0
	;sub	ax,[varmask]		
	
	mov	ebx,[varmask]			; move eax para eax para retornar o valor para o kernel

	mov 		eax,1			; eax = 1, comando de saida para o kernel
	int		0x80				; chama interrupcao - fim do programa
