#include <stdio.h>

//typedef: define un tipo de dato
typedef struct {
	char tel[11];
	char nom[25];
	char alias[15];
}agenda;

main(){
	agenda familia;
	printf("Numero: ");
	scanf("%s", &familia.tel);
	printf("Nombre: ");
	scanf("%s", &familia.nom); 
	printf("Alias: ");
	scanf("%s", &familia.alias);
	printf("%s, su numero celular es %s y le dicen %s", familia.nom, familia.tel, familia.alias);
}
