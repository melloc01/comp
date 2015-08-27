int main(int argc, char const *argv[])
{

	int a = 2;
	int b = 4;

	int res = 0;
	int i;

	if (a < b) {
	
		for (i=0; i<a; i++) {
	
			res += i;
	
		}
	
	} else {
	
		res = a * b;
	
	}
	
	printf("%d\n", res);

}