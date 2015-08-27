  SECTION   .data

LINE_BREAK  EQU 10

pares:   TIMES 3 DB  '2',LINE_BREAK
numero:   DB 5

  SECTION .text

  global _start


  _start:

    mov ecx,pares
    add BYTE[ecx], 5

    mov edx,2   ; tamanho do que vai sair na tela
    mov ebx,1   ; saida no display
    mov eax,4   ; sysout
    int 0x80	; chama kernel
   
    add ecx,2
    
    mov edx,2   ; tamanho do que vai sair na tela
    mov eax,4   ; sysout
    mov ebx,1   ; saida no display
    int 0x80    ; interrupção 80hex, chama kernel


    add ecx,2
    
    mov edx,2   ; tamanho do que vai sair na tela
    mov eax,4   ; sysout
    mov ebx,1   ; saida no display
    int 0x80    ; interrupção 80hex, chama kernel

   
    mov ebx,0   ; EXIT = SUCCESS CODE 
    mov eax,1   ; EXIT command
    int 0x80
