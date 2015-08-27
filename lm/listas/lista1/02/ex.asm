	SECTION .data				; data section

arr:	TIMES 4 DB 1 


  SECTION .text					; code section

  global _start
						; program entry point

  _start:
	
	; save arr pos on EAX
	mov 	edx, arr

	mov	BYTE [edx],49
	
	add 	edx,1
	mov	BYTE [edx],50

	add 	edx,1
	mov	BYTE [edx],52

	add 	edx,1
	mov	BYTE [edx],56
	
	
	mov	edx,4 				; print 4 bytes	
	mov 	ecx,arr
	mov 	ebx,1
	mov	eax,4
	int	0x80
	

	mov	ebx,0
	mov	eax,1
	int 	0x80	



