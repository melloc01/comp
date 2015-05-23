  SECTION   .data

char:  db 'ASSEMBLY'  ; 
  
  SECTION .text

  global _start


  _start:

    mov ecx,char
    
    mov edx,1   ; tamanho do que vai sair na tela
    mov ebx,1   ; saida no display
    mov eax,4   ; sysout
    int 0x80	; chama kernel
   
    mov ecx,char
    add ecx,1	; faz começar o print que está na posição seguinte da string 
    
    mov edx,1   ; tamanho do que vai sair na tela
    mov eax,4   ; sysout
    mov ebx,1   ; saida no display
    int 0x80    ; interrupção 80hex, chama kernel

    mov ebx,0   ; EXIT = SUCCESS CODE 
    mov eax,1   ; EXIT command
    int 0x80
