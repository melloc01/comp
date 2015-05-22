; **********************************************************************************************
;
;	Resolução de expressões:
;	R = (A - B) * (D + E) - F	
;
; **********************************************************************************************


	
	SECTION .data

A:	db	10
B:	db	8
D:	db	1
E:	db	3
F:	db	2


	SECTION .text		

  global _start
 
 _start:
	
	mov 	eax,[A]			; eax = A
	sub 	eax,[B]			; eax -=

	mov	ebx,[D]
	add	ebx,[E]
	
	mul	ebx
	
	sub	eax,[F]

	mov	ebx,eax			; move eax para eax para retornar o valor para o kernel
	mov 		eax,1		; eax = 1, comando de saida para o kernel
	int		0x80		; chama interrupcao - fim do programa
