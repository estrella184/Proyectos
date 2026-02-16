#include <stdio.h> //ESTRUCTURAS
#include <windows.h>

main(){
		//datos es el nombre de la estructura
	struct datos{
		int mat;
		char nom[20];
		int edad;	
	}alumnos[5]; //arreglo de 5 elementos
	//struct datos alumnos;
	
	for(int x=0; x<5; x++){
		system("cls");
		printf("Matricula: ");
		scanf("%i",&alumnos[x].mat);
		printf("Nombre: ");
		scanf("%s", &alumnos[x].nom);
		printf("Edad: ");
		scanf("%i", &alumnos[x].edad);
	}
	printf("El alumno %s con matricula %i tiene %i años.\n\n", alumnos[3].nom, alumnos[3].mat, alumnos[3].edad);
}
