	SECTION .data				; data section

var:	DB 5 


  SECTION .text					; code section

  global _start
						; program entry point

  _start:
	
	mov 	ecx, [var]
	
	mov 	eax,ecx
	
	sub	ecx,1			; 5*4
	mul 	ecx

	sub	ecx,1			; 5*4*3
	mul 	ecx

	sub	ecx,1
	mul 	ecx			; 5*4*3*2
		
	mov 	ecx, [var]
	mov 	ebx,5
	
	sub	ecx,1			; 5 + 4		
	add	ebx,ecx
	
	sub	ecx,1
	add	ebx,ecx			; 5 + 4 + 3 
	
	sub	ecx,1
	add	ebx,ecx			; 5 + 4 + 3 + 2
	
	sub	ecx,1
	add	ebx,ecx			; 5 + 4 + 3 + 2 + 1
	
	sub 	eax,ebx		

	mov 	ebx,eax
	mov	eax,1
	int 	0x80	



