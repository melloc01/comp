#include "stdio.h"
#include "time.h"


// para compilar: gcc -m32 -o ex.out main.c 

#ifndef SIZE
	#define SIZE 10
#endif


/**
	fillMatrix
		@param matrix1[x][y]
		@param matrix2[x][y]
	
*/
void fillMatrix(int matrix1[SIZE][SIZE]){
  
	int i,j = 0;

	for(i = 0; i < SIZE; i++){
    
    	for(j = 0; j < SIZE; j++){

      		matrix1[i][j] = (1 + rand()%9);

    	}

  	}

}

/**
	printMatrix
		@param matrix1[x][y]
		@param matrix2[x][y]
	
*/
void printMatrix(int mat[SIZE][SIZE]) {

	int i,j,k;

	for(i=0; i < SIZE; i++) {

		if (i == 0){
			for (k = 0; k < SIZE; k++)
				printf("■■■■■■");
			printf("\n");
		}

		for(j = 0; j < SIZE; j++){
			
			if (j==0) 
				printf("■ ");

			if (mat[i][j] < 10)
				printf("  %d   ", mat[i][j]);    
			else if (mat[i][j] < 100)
				printf("  %d  ", mat[i][j]);    
			else if (mat[i][j] < 100)
				printf("  %d  ", mat[i][j]);    
			else if (mat[i][j] < 1000)
				printf("  %d ", mat[i][j]);    
			else if (mat[i][j] < 10000)
				printf("  %d", mat[i][j]);    
			else if (mat[i][j] < 100000)
				printf(" %d", mat[i][j]);


			if (j == (SIZE-1)) 
				printf("■");		
		}


		if (i == (SIZE -1)){
			printf("\n");
			for (k = 0; k < SIZE; k++)
				printf("■■■■■■");
			printf("\n");
		}
		printf("\n");
	
	
	}

}

/*
		mul2Matrix
			- same dimensions

			@param mat1
			@param mat2
*/	
void mul2Matrix(int mat1[SIZE][SIZE], int mat2[SIZE][SIZE], int matR[SIZE][SIZE]) { 

    int i, j, k;

  	for(i = 0; i < SIZE; i++) {
    	for(j = 0; j < SIZE; j++) {
      		
      		matR[i][j]=0;
      		
      		for(k = 0; k < SIZE; k++){ 
				
				matR[i][j] = (matR[i][j] + (mat1[i][k] * mat2[k][j]));
      		}
    	}
  	} 
}

/*
		mulMatrixByConst
			- same dimensions

			@param mat1
			@param mat2
*/	
void mulMatrixByConst(int mat[SIZE][SIZE], int x) { 

    int i, j;

  	for(i = 0; i < SIZE; i++) {
    	
    	for(j = 0; j < SIZE; j++) {
      		
      		mat[i][j] = x * mat[i][j];

    	}

  	} 

}

int main(int argc, char const *argv[]) {
	
	int matA[SIZE][SIZE], matB[SIZE][SIZE], matR[SIZE][SIZE];
	clock_t execTime;
	
	fillMatrix(matA);
	fillMatrix(matB);

	execTime = clock();

	mul2Matrix(matA, matB, matR);
	mulMatrixByConst(matR, 3);

	execTime = clock() - execTime;


	printf("\n■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■\n");
	printf("Execução em %dms", execTime);
	printf("\n■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■\n");

	printf("\nMatriz 1 \n");
	printMatrix(matA);
	
	printf("\nMatriz 2 \n");
	printMatrix(matB);
	
	printf("\nMatriz Resultado \n");
	printMatrix(matR);

	return 0;

}