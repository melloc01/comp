	SECTION .data			; data section

var1:	DB	100
var2:	DB	1
var3:	DB	19

	SECTION .text			; code section

	global _start
	
_start:						; program entry point


	mov 	edx,var1

_CMP_:
	
	mov 	AL,[edx]		; AL = var1
	inc 	edx				; edx points to next byte
	mov 	BL,[edx] 		; BL = var2

	cmp 	AL,BL

	jl 		_AL_menor_BL_ 	; if AL < BL
	jge 	_BL_menor_AL  	; if BL <= AL


_AL_menor_BL_:
	mov 	DH,AL
	jmp 	_CMP_DH_var3

_BL_menor_AL:
	mov 	DH,BL
	jmp 	_CMP_DH_var3


_CMP_DH_var3:
	
	mov 	AL,[var3]
	mov 	BL,DH

	cmp 	AL,BL

	jg 		KERNEL_RETURN
	mov 	BL,AL

KERNEL_RETURN:

	mov		eax,1
	int 	0x80