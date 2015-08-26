	SECTION .data


NUM_OF_ROWS 	EQU 	4
NUM_OF_COLS		EQU		3
ARRAY_SIZE		EQU 	NUM_OF_ROWS * NUM_OF_COLS

%assign 	SIZE 	2
%iassign 	valor 	3

	SECTION .text

  global _start

  _start:

	;mov		ebx,ARRAY_SIZE

	%iassign 	vAloR	4
	mov 		ebx, vAloR

	mov 		eax,1
	int		0x80