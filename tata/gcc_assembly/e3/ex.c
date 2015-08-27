#include "stdio.h"

// as --32 -o sum.o sum.s GAS
// nasm -f elf -o sum.o sum.asm
// para compilar: gcc -m32 -o ex.out ex.c sum.o

int main(int argc, char const *argv[])
{
	int v1 	= 10; 
	int v2 	= 30;
	int r 	= 0;
	extern int sum_asm (int, int);
	
	r = sum_asm(v1,v2);

	printf("Valor da Soma: %d \n", r);

	return 0;
}