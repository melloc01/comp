int main(int argc, char const *argv[])
{

	int a = 19;

	int res = 0;
	int count = 1;

	while (count <= a) {
	
		if (count <= 5) {
	
			res = res + 3;
	
		} else if ( (count >= 10) && (count <= 15) ) {  //  10 <= count <= 15
	
			res = res + 2;
	
		} else { // count > 15 ||  6 <= count <= 9
	
			res++;
	
		}
	
		count++;
	
	}
	
	printf("%d\n",res);

}