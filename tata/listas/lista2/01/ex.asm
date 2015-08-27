	SECTION .data				; data section

arr:	TIMES 4 DB 1 


  SECTION .text					; code section

  global _start
						; program entry point

  _start:
	
	; save arr pos on EAX
	mov 	edx, arr
	
	mov	ecx,0	
	
	inc 	edx
	mov	BYTE [edx],2

	inc 	edx
	mov	BYTE [edx],4

	inc 	edx
	mov	BYTE [edx],8
	
	; iterate && sum
	mov 	edx,arr

	add	ecx,[edx]
	
	inc 	edx
	add	ecx,[edx]	
	
	inc 	edx
	add	ecx,[edx]	
		
	inc 	edx
	add	ecx,[edx]	

	mov	ebx,ecx
	mov	eax,1
	int 	0x80	



