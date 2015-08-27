; X = P! -­ (P + (P - ­1) + (P - ­2) + ... + 1)	

	SECTION .data			; data section

base:	DB 	2
expo: 	DB 	4


	SECTION .text			; code section

	global _start
	
_start:						; program entry point

init:
	mov 	CL,[expo]		
	mov 	eax,1

cmp_exp_zero:
	cmp 	CL,0	
	jne 	_POT_ 			

	mov 	BL,1			; if expo = 0 return 1
	jmp 	KERNEL_RETURN

_POT_:
	
	mul 	BYTE [base]
	dec 	CL

	cmp 	CL,0
	jne 	_POT_

	mov 	AH,AL 			; AH = POT

	
	mov 	BL,AH

KERNEL_RETURN:

	mov		eax,1
	int 	0x80