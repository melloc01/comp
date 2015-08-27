; assemble: nasm -f -l *dest-name* *src-name*
; link ld -m elf_i386 -s -o hello hello.o


SECTION .data					; data section
msg:	db "Hello World",10		; the string to print, 10=cr
len:	equ $-msg				; $ means "here"
								; len is a value, not an address


SECTION .text					; code section

global _start

; program entry point

  _start:
	mov 	edx, len
	mov	ecx, msg
	mov 	ebx, 1
	mov 	eax, 4
	int	0x80

	mov	ebx, 0
	mov	eax, 1
	int	0x80