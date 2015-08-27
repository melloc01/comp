; Escreva um programa que inicialize 10 posições de memórias com caracteres em 
; maiúsculo, ordene­os em ordem alfabética e exiba na tela o conteúdo do vetor

	SECTION .data			; data section

vet:	DB 'A','G','C','B','D','E','F','I','H','J'

ordered_vet: TIMES 10 DB 'b'


	SECTION .text			; code section

	global _start
	
_start:						; program entry point
	
init:

	mov 	ecx,0			; counter
	mov 	edx,vet

get_lesser:
	
	cmp 	ecx,8
	jg 		add_lesser

	lea 	ecx, [edx + ecx+1]
	lea 	eax, [edx + ecx]

	cmp 	ecx,eax
	jl 		add_lesser
	xchg 	ecx,eax
	jle 	add_lesser

	inc ecx

add_lesser: 									; ecx <= eax
	
	mov 	eax,ordered_vet

	jmp 	init
	

print_vet:

	mov 	edx,10
	mov 	ecx,[ordered_vet]			; print val
	mov 	ebx,1 								; select screen
	mov 	eax,4 								; call sysout
	int 	0x80	 								; int

	
KERNEL_RETURN:

	mov		eax,1
	mov 	ebx,0
	int 	0x80