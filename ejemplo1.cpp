#include <stdio.h>
#include <windows.h>
main(){
    int num[5]={0};
    for( int x=0; x<5; x++ ){
		system("cls"); // cls: clear screen	
    	printf("Captura un numero: ");
    	scanf("%i", &num[x]); //& representa el espacio en memoria de la variable
	} 
	system("cls");
	for( int x=0; x<5; x++ )
	
    	printf("El numero es: %i y esta en la localidad %i\n", num[x],x+1); // \n salto de línea
	
}
