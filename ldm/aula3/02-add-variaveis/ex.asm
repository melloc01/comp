	SECTION .data

var1:	DB	10
var2:	DB 	10h
var3:	DB	28
var4:	DB 	0
var5: 	DB	30,60
var6:	DB	20

	SECTION .text

  global _start

  _start:


	;mov 	eax,[var1]
	;add	eax,[var2]
	;mov	ebx,eax

	;mov 	eax,var3
	;add	eax,var4
	;mov	ebx,eax

	mov 	eax,var5
	add	eax,1
	mov	ebx,[eax]
	add 	ebx,[var6]

	mov 	eax,1
	int	0x80

