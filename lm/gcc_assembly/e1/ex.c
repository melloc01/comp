#include "stdio.h"


// para compilar: gcc -m32 proc4.c

int main(int argc, char const *argv[])
{
	
	int v1=10; int v2=30;
	int r=sum_asm(v1,v2);

	printf("Valor da Soma: %d \n",r);

	return 0;
}

int sum(int n1, int n2){
	return n1+n2;
}

int sum_asm(int n1, int n2) {

	asm("mov 12(%ebp), %ebx");
	asm("mov 8(%ebp), %eax");
	asm("add %ebx, %eax");

	// asm("mov 12(%ebp), %eax);
	
}