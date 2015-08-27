; X = P! -­ (P + (P - ­1) + (P - ­2) + ... + 1)	

	SECTION .data			; data section

a:	DB 	19

	SECTION .text			; code section

	global _start
	
_start:						; program entry point

init:
	
	xor 	DL,DL 			; res
	mov 	CL,1				; counter

count_menor_igual_5:

	cmp 	CL,[a]
	jg 		count_greater_a

	cmp 	CL,5 	
	jg		count_maior_5
	
	add 	DL,3
	inc 	CL
	
	jmp 	count_menor_igual_5


count_maior_5:

	cmp 	CL,[a]
	jg 		count_greater_a

	cmp 	CL,10
	jge 	count_maior_igual_10

	inc 	DL

	inc 	CL
	jmp 	count_maior_5



count_maior_igual_10:

	cmp 	CL,[a]
	jg 		count_greater_a

	cmp 	CL,15
	jg 		count_maior_15
	
	add 	DL,2

	inc 	CL
	jmp 	count_maior_5


count_maior_15:

	cmp 	CL,[a]
	jg 		count_greater_a

	inc 	DL

	inc 	CL
	jmp 	count_maior_15


count_greater_a:
	mov 	BL,DL
	jmp 	KERNEL_RETURN


KERNEL_RETURN:

	mov		eax,1
	int 	0x80

cmp_a:
	cmp 	CL,[a]
	je 		KERNEL_RETURN