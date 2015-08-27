	.text

	.global sum_asm

sum_asm:
	
	push 	%ebp
	mov 	%esp,%ebp

	mov 	8(%ebp),%eax 	# primeiro parâmetro (tem um push no começo)
	add 	12(%ebp),%eax	# segundo parâmetro (integer tem 32bits)
	pop 	%ebp

	ret
	