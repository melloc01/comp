; X = P! -­ (P + (P - ­1) + (P - ­2) + ... + 1)	

	SECTION .data			; data section

a:	DB 	6
b: 	DB 	5


	SECTION .text			; code section

	global _start
	
_start:						; program entry point

init:
	
	xor 	DL,DL 			; res
	xor 	CL,CL

	mov 	CH,[a]
	cmp 	CH,[b]


	jl 		a_menor_b
	jmp 	a_maior_b

a_menor_b:

	add 	DL,CL
	inc 	CL

	cmp 	CL,[a]
	jl		a_menor_b

	mov 	BL,DL
	jmp 	KERNEL_RETURN


a_maior_b:
	
	mov 	eax,[a]
	mul 	BYTE [b]

	mov 	ebx,eax
	jmp 	KERNEL_RETURN
	
KERNEL_RETURN:

	mov		eax,1
	int 	0x80