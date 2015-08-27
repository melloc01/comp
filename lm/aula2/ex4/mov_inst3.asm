  SECTION   .data

depto:    DB 'DEMAC',0DH,0AH  ; string def
unidade:  DB 'I'
          DB 'G'
          DB 'C'
          DB 'E'
          DB 0xD
          DB 0xA


  SECTION .text

  global _start


  _start:

    mov ecx,unidade
    
    mov edx,6   ; tamanho do que vai sair na tela
    mov ebx,1   ; saida no display
    mov eax,4   ; sysout
    int 0x80	; chama kernel
   
    mov ecx,depto
    
    mov edx,7   ; tamanho do que vai sair na tela
    mov eax,4   ; sysout
    mov ebx,1   ; saida no display
    int 0x80    ; interrupção 80hex, chama kernel

    ; OU

    mov ecx,depto

    mov edx,13   ; tamanho do que vai sair na tela
    mov ebx,1   ; saida no display
    mov eax,4   ; sysout
    int 0x80  ; chama kernel
   
    mov ebx,0   ; EXIT = SUCCESS CODE 
    mov eax,1   ; EXIT command
    int 0x80
