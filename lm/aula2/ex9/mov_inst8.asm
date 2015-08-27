  SECTION   .data

LINE_BREAK  EQU 10

univ:   DB 'UNESP',0AH

  SECTION .text

  global _start


  _start:

    mov     edx,univ    ; endereço de univ -> edx
   
    mov     ecx,6       ; tamanho da string pra imprimir
    mov     ebx,1
    mov     eax,4

    xchg    ecx,edx     ; troca de valores ecx com edx
    int     0x80

    mov ebx,0           ; EXIT CODE
    mov eax,1           ; EXIT COMMAND
    int 0x80            ; INTERRUPT, CALL KERNEL
