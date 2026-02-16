#include <stdio.h>
#include <stdlib.h>
int buscar(float dato[], int tope, float num, int ini){
	if(dato[ini]==num)
	return ini;
	if(ini==tope)
	return -1;
	else
	return buscar(dato,tope,num,ini +1);
}

main(){
	system("cls");
	float arr[]={1.1,2.3,3.3,10,0.36,6.6,23.36,45.9,87.5,25.6};
	int limite=9, inicio=0;
	float valor=0;
	printf("Ingresa el valor: ");
	scanf("%f", &valor);
	printf("%0.2f en la posicion %i", valor, buscar,(arr,limite,valor,inicio));
}

