; **********************************************************************************************
;	Pilhas
; **********************************************************************************************
	
	SECTION .data

var1:		DW	89
var2:		DW	70				; define word
var3: 	DD 	103

	SECTION .text		

global _start
 
_start:
		
	push 	WORD [var1]

	mov 	ax,[var2]
	push 	ax

	mov 	eax,[var3]
	push 	eax

	mov ebx,[esp] 		; 103

	;mov ebx,[esp+4] 	; 70

	; add 	esp,6					; 89
	; pop 	bx 						; ret values

	mov 	eax,1					; eax = 1, comando de saida para o kernel
	int		0x80					; chama interrupcao - fim do programa