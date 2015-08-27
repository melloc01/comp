	SECTION .data				; data section

P: 	DB 2,3,5
N:	DB 8,6,7


N1:	DB 0
N2:	DB 0
N3:	DB 0

NUMER_OF_TESTS:	DB 3

MEAN:	DB 0

  SECTION .text					; code section

  global _start
						; program entry point

  _start:
		
	mov 	ebx,P
	mov	ecx,N	

	mov 	eax,2
	mul	BYTE [ecx]			; 2 x 8
	
	
	mov	ebx,ecx
	mov	eax,1
	int 	0x80	



