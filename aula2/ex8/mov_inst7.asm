  SECTION   .data

LINE_BREAK  EQU 10

char:   DB 'A'

  SECTION .text

  global _start


  _start:

    mov ebx,[char]      ; conteudo -> ebx
    
    ;mov ebx,char       ; endereço -> ebx
    ;lea ebx,[char]     ; endereço -> ebx

    mov eax,1
    int 0x80

    

;LEA só aceita endereço - sintaxe diferente
;mov ebx,char       ; endereço -> ebx
;lea ebx,[char]     ; endereço -> ebx
;lea ebx,char       ; INVÁLIDO