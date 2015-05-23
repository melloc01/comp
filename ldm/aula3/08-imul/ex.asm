; **********************************************************************************************
;	
;	imul : multiplicação considerando valores negativos (complemento p/ 2)
;
; **********************************************************************************************


	
SECTION .data

var1:	db	10h	; 16
var2:	db	0xFF						; (-1)

	SECTION .text		

  global _start

  _start:
	
	mov ax,[var1]						; ax = var
	mov bx,[var2]						; bx = var2
	imul bx								; ax = bx * ax

	; 16 * (-1) = -16
	; !(00010000) + 1 = 11101111 > 11110000

	mov	ebx,eax							; move eax para eax para retornar o valor para o kernel
	mov 		eax,1					; eax = 1, comando de saida para o kernel
	int		0x80						; chama interrupcao - fim do programa
