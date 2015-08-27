#include "stdio.h"


// para compilar: gcc -m32 proc4.c

int main(int argc, char const *argv[])
{
	
	int vet[3] = {9, 7, 4};

	// int r = sum(vet);
	int r = sum_asm(vet);
	
	printf("Valor da Soma: %d \n",r);

	return 0;
}

int sum(int pvet[3]){

	return pvet[0] + pvet[1] + pvet[2];

}

int sum_asm(int pvet[3]) {

	asm("mov 	8(%ebp),%ebx");
	asm("xor 	%eax,%eax");
	asm("add 	(%ebx), %eax");  	// add 	eax,[ebx]
	asm("add 	4(%ebx), %eax"); 	// add 	eax,[ebx+4]
	asm("add 	8(%ebx), %eax");	// add 	eax,[ebx+8]

}