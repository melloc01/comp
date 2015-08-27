; **********************************************************************************************
;	Pilhas
; **********************************************************************************************
	
	SECTION .data	

var1:		DW	12
var2:		DW	5				; define word

	SECTION .text		

global _start
 
_start:
		
	push 	WORD 	[var1]
	push 	WORD 	[var2]

	call 	proc_triplo_maior

	mov 	bx,ax
	mov 	eax,1					; eax = 1, comando de saida para o kernel
	int		0x80					; chama interrupcao - fim do programa


proc_triplo_maior:
		push 	ebp
		mov 	ebp,esp

		mov 	ax,[ebp+10]
		mov 	bx,[ebp+8]

		cmp 	ax,bx
		jl  	b_maior
		jmp 	triplo

	b_maior:
		mov 	ax,bx

	triplo:
		mov 	bx,3
		mul 	bx
		pop 	ebp
		ret 	4 				; tira o push do ebp 