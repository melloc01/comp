; **********************************************************************************************
;
;	Resolução de expressões:
;
;	A + B * C - D * F + G - H
;	H - B * D + C * G + A
;
; **********************************************************************************************	
	SECTION .data

A:	db	1
B:	db	2
C:	db	3
D:	db	4
F:	db	5
G:	db	6
H:	db	7


	SECTION .text		

  global _start
 
  _start:
	
;	(A + (B * C)) - ((D * F) + G - H)
;	 1 + 2 * 3    -   4 * 5  + 6 -7

	mov 	eax,[D]
	mul	BYTE [F]
	
	; guarda resultado da primeira parte	
	mov 	ebx,eax

	mov 	eax,[B]			; eax = A	
	mul	BYTE [C]			; eax * [C]  ( metado menos significativa pra eax e mais pra edx)
	
	sub 	eax,ebx			; B*C  - D*F

	add 	eax,[A]
	add	eax,[G]
	sub	eax,[H]
	

	not	eax			; complemento de 2
	inc	eax
	
	mov	ebx,eax
	mov 	eax,1			; eax = 1, comando de saida para o kernel
	int	0x80			; chama interrupcao - fim do programa



