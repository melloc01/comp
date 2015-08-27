  SECTION   .data

LINE_BREAK  EQU 10

char:   DB 'A'

  SECTION .text

  global _start


  _start:

    mov eax,4
    add eax,48

    mov [char], eax

    mov edx,1
    mov ebx,1
    mov ecx,char
    mov eax,4
    int 0x80

    mov ebx,0
    mov eax,1
    int 0x80