#include <stdio.h>
#include <malloc.h> estructura estatica

main(){
	int *pdato=NULL;
	//malloc: nos permite poder reservar un espacio de memoria
	pdato=(int *)malloc(sizeof(int)); //sizeof: obtiene el tamaño de tipo de dato, y sizeof le asigna el tamalo automaticamente
	if(pdato!=NULL)
		printf("Se creo un espacio de memoria para pdato.");
	printf("\nLa direccion de pdato es: %p",pdato); //el espacio se va a liberar hasta que mi computadora se apague
	free(pdato); //se va a crear y se va a liberar un espacio de memoria
	pdato=NULL;
	if(pdato==NULL)
		printf("\nSe libero el espacio de memoria para pdato.");	
}
