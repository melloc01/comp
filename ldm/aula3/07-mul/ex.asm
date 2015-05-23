; **********************************************************************************************

; Importante: o registrador AX é a parte menos significative do registrador EAX
; Portanto, ao mudar o valor de AX, está também mudando o valor de EAX

; Essa relação se dá: EAX > AX > (AH|AL) (high|low)

; **********************************************************************************************


	
SECTION .data

var1:	db	10h
var2:	db	10

	SECTION .text		

  global _start

  _start:
	
	mov ax,[var1]
	mov bx,[var2]
	mul bx
	
	mov	ebx,eax				; move eax para eax para retornar o valor para o kernel
	mov 		eax,1		; eax = 1, comando de saida para o kernel
	int		0x80			; chama interrupcao - fim do programa
