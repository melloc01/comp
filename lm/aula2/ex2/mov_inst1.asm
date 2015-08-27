	SECTION 	.data

char:	db 'A' ;0x41 ou 41h ou 65: Ele aloca o código ASC do A

	
	SECTION	.text

  global _start


  _start:


  	mov edx,1		; tamanho do que vai sair na tela
  	mov ebx,1		; saida no display
  	mov ecx,char
  	
  	mov eax,4		; sysout
  	int 0x80		; interrupção 80hex, chama kernel

  	mov ebx,0		; EXIT = SUCCESS CODE 
  	mov eax,1		; EXIT command
  	int 0x80