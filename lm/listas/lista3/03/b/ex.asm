; Fibonacci
;
;				|	0, 					se n = 0
;		F(n) = 	|	1, 					se n = 1
;				| 	F(n-1)  + F(n-2), 	se n > 1
;


	SECTION .data			; data section

n:	DB 	9


	SECTION .text			; code section

	global _start
	
_start:						; program entry point
	
	xor 	AL,AL

	mov 	CL,2			; 2 on counter
	mov 	DL,0	 		; 0 on result F(0)
	mov 	DH,1	 		; 1 on result F(1)

fn:	

	add 	DL,DH 			; Get next F(n)
	
	mov 	BL,DH			; swap DL and DH
	mov 	DH,DL
	mov 	DL,BL

	inc 	CL

	cmp 	CL,[n]
	jne 	fn

	xor 	ebx,ebx

	add 	DH, DL

	mov 	BL,DH

KERNEL_RETURN:

	mov		eax,1
	int 	0x80

DEBUG:

	mov 	eax,4
	mov 	ebx,1
	int 	0x80