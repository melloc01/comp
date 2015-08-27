  SECTION   .data

LINE_BREAK  EQU 10

msg:   DB 'AD'

  SECTION .text

  global _start


  _start:

    mov ebx,[msg]   ; EXIT value: move o conteudo de msg para ebx
    
    mov eax,1   ; EXIT command
    int 0x80