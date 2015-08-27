	SECTION .data

	x:	DB	10

	SECTION .text


  global _start

  _start:

	mov 	eax,0x10
	add 	eax,[x]
	mov 	ebx,eax

	mov 		eax,1
	int		0x80