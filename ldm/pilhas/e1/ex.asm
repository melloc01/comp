; **********************************************************************************************
;	Pilhas
; **********************************************************************************************
	
	SECTION .data

A:	db	10
B:	db	8		;define byte

	SECTION .text		

global _start
 
_start:
		
	mov 	eax,[A]
	mov 	ebx,[B]

	push 	eax
	push 	ebx
	pop 	ebx

	mov 	eax,1		; eax = 1, comando de saida para o kernel
	int		0x80		; chama interrupcao - fim do programa