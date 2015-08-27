; **********************************************************************************************
;	Pilhas
; **********************************************************************************************
	
	SECTION .data	

var1:		DB	12
var2:		DB	5				; define word

	SECTION .text		

global _start
 
_start:
		
	mov 	al,[var1]
	mov 	bl,[var2]

	call 	proc_triplo_maior

	mov 	bx,ax
	mov 	eax,1					; eax = 1, comando de saida para o kernel
	int		0x80					; chama interrupcao - fim do programa


proc_triplo_maior:
	cmp 	al,bl
	jl  	b_maior
	jmp 	triplo

b_maior:
	mov 	al,bl

triplo:
	mov 	bl,3
	mul 	bl
	ret