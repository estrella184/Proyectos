#include <stdio.h>

// resultado resursivo
int factorial(int n){
	if(n==0 || n==1)
		return 1;
	else
		return n * factorial(n-1);
}

int main(){
	int num;
	
	printf("Ingrese un numero: ");
	scanf("%d", &num);
	
	int resRec=factorial(num);
	

    printf("\nFactorial de %d es: = %d\n", num, resRec);

}
