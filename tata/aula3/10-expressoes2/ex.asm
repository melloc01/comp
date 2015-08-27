; **********************************************************************************************
;
;	Resolução de expressões:
;	R = F + (A * E) - (D * B)
;
;
;
;	Importante:
;		- O montador não sabe o tamanho da variável quando é chamada numa operação
;	portanto é necessário definí-lo:
;	
;	DB: mul BYTE [variavel]  1 Byte
;	DW: mul WORD [variavel]	 2 Bytes
;		
;
; **********************************************************************************************


	
	SECTION .data

A:	db	10
B:	db	8		;define byte
D:	db	1
E:	db	3
F:	db	2


	SECTION .text		

  global _start
 
  _start:
	
	mov 	AL,[A]			; AL = A
	mul 	BYTE [E]		; AL = [A] * [E]
	
	mov	BL, AL				; BX = AL

	mov	AL,[D]				; AL = [D]
	mul 	BYTE [B]		; AL = [D] * [B]

	sub	BL,AL				; BX = BX - AL
	
	add	BL,[F]				; adiciona e já deixa no reg. de saída

	mov 	eax,1			; eax = 1, comando de saida para o kernel
	int	0x80				; chama interrupcao - fim do programa
