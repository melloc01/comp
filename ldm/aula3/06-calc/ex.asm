	SECTION .data

var1:	db	9
var2:	db	0xF7			; -9
var3:	db	5
var4	db	0xF6			; -10

	SECTION .text

  global _start

  _start:
	
	mov	eax,[var1]			; eax  = [var1]
	sub	eax,[var2]			; eax -= [var2]
	add	eax,[var3]			; eax += [var3] 
	add	eax,[var4]			; eax += [var4]


	
	mov	ebx,eax				; move eax para eax para retornar o valor para o kernel

	mov 		eax,1		; eax = 1, comando de saida para o kernel
	int		0x80			; chama interrupcao - fim do programa
