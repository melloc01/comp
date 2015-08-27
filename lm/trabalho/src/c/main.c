#include "stdio.h"
#include "time.h"


// para compilar: gcc -m32 -o ex.out main.c 

#ifndef SIZE
	#define SIZE 3
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
		add2Matrix
			- same dimensions

			@param mat1
			@param mat2
*/	
void add2Matrix(int mat1[SIZE][SIZE], int mat2[SIZE][SIZE], int matR[SIZE][SIZE]) { 

    int i, j, k;

  	for(i = 0; i < SIZE; i++) {

    	for(j = 0; j < SIZE; j++) {
      		
      		matR[i][j] = mat1[i][j] + mat2[i][j];
      		
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

int sumMatrixMainDiagonal (int mat[SIZE][SIZE]) { 

	int i,j;
	int sum = 0;

	for (i = 0; i < SIZE; i++) {

		for (j = 0; j < SIZE; j++) {

			if (i == j)
				sum += mat[i][j];

		}

	}

	return sum;
}

int main(int argc, char const *argv[]) {
	
	int matA[SIZE][SIZE], matB[SIZE][SIZE], matC[SIZE][SIZE], matR[SIZE][SIZE], matAux[SIZE][SIZE];
	int mainDiagonal;

	clock_t execTime;
	
	fillMatrix(matA);
	fillMatrix(matB);
	fillMatrix(matC);

	execTime = clock();

	mul2Matrix(matA, matC, matAux);
	mulMatrixByConst(matAux, 3);
	add2Matrix(matAux, matB, matR);
	mainDiagonal = sumMatrixMainDiagonal(matR);
	
	execTime = clock() - execTime;


	printf("\n■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■\n");
	printf("Execução em %dms", execTime);
	printf("\n■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■\n");

	printf("\nMatriz A \n");
	printMatrix(matA);
	
	printf("\nMatriz B \n");
	printMatrix(matB);

	printf("\nMatriz C \n");
	printMatrix(matC);
	
	printf("\nMatriz Resultado \n");
	printMatrix(matR);

	printf("\nValor da Diagonal principal : %d \n \n■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ \n\n", mainDiagonal);

	return 0;

}