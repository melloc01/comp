; X = P! -­ (P + (P - ­1) + (P - ­2) + ... + 1)	

	SECTION .data			; data section

P:	DB	4

	SECTION .text			; code section

	global _start
	
_start:						; program entry point

	mov 	CL,[P]
	mov 	eax,1

_FAT_:
	
	mul 	CL
	dec 	CL

	cmp 	CL,0
	jne 	_FAT_

	mov 	AH,AL 			; AH = FAT


	xor 	CH,CH
	mov 	CL,0

_SUM_:
	
	mov 	DL,[P]

	sub 	DL,CL 			; DL = P .. P - 1 ..
	add 	CH,DL			; CH =  P + P-1 + P-2

	inc 	CL
	cmp 	CL,[P] 			; compares CL and [P]
	jne 	_SUM_

	sub 	AH,CH
	mov 	BL,AH



KERNEL_RETURN:

	mov		eax,1
	int 	0x80