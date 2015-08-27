	SECTION .text

	global sum_asm

sum_asm:
	
	push 	ebp
	mov 	esp,ebp

	mov 	eax,[ebp+8]		; primeiro parâmetro (tem um push no começo)
	add 	eax,[ebp+12]	; segundo parâmetro (integer tem 32bits)
	
	mov 	esp,ebp
	pop 	ebp

	ret