	SECTION .data				; data section

var:	DB 6 


  SECTION .text					; code section

  global _start
						; program entry point

  _start:
	
	
	mov ebx,[var]
	
	not ebx
	inc ebx


	mov	eax,1
	int 	0x80	



