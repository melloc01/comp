#include "stdio.h"


// para compilar: gcc -m32 -o ex.out main.c 

#ifndef SIZE
	#define SIZE 3
#endif


/**
	fillMatrix
		@param matrix1[x][y]
		@param matrix2[x][y]
	
*/
void fillMatrix(int matrix1[SIZE][SIZE], int matrix2[SIZE][SIZE]){
  
	int i,j = 0;

	for(i = 0; i < SIZE; i++){
    
    	for(j = 0; j < SIZE; j++){

      		matrix1[i][j] = (1 + rand()%9);
      		matrix2[i][j] = (1 + rand()%9);

    	}

  	}

}


/**
	printMatrix
		@param matrix1[x][y]
		@param matrix2[x][y]
	
*/
int printMatrix(int mat[SIZE][SIZE]){ //exibe a matriz

	int i,j,k;

	printf("\n \n");
	printf("Matrix\n");
	
	for(i=0; i < SIZE; i++) {

		if (i == 0){
			for (k = 0; k < SIZE; k++)
				printf("■■■");
			printf("\n");
		}

		for(j = 0; j < SIZE; j++){
			
			if (j==0) 
				printf("■ ");

			printf("%d ", mat[i][j]);    

			if (j == (SIZE - 1)) 
				printf("■");

		}


		if (i == (SIZE -1)){
			printf("\n");
			for (k = 0; k < SIZE; k++)
				printf("■■■");
			printf("\n");
		}
		printf("\n");
	
	
	}

}

int main(int argc, char const *argv[])
{
	
	int mat1[SIZE][SIZE], mat2[SIZE][SIZE], matR[SIZE][SIZE];
	
	fillMatrix(mat1, mat2);

	printMatrix(mat1);
	printMatrix(mat2);

	return 0;

}