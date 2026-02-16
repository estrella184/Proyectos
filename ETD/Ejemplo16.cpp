#include<stdio.h>
#include<windows.h>
#include<malloc.h>
#include<conio.h>
#include<string.h>
#include<stdlib.h>

struct libros {
	char nom[15];
	char aut[15];
	int npag;
	struct libros *sig;
};

typedef struct libros pila;
typedef pila *NODOPTR;

int valinum(int lon){
	char c;
	char numero[10];
	int x=0;
	x=0;
	do{
		c=getch();
		if(c>=48 && c<=57){
			printf("%c",c);
        	numero[x]=c;
        	x++;
    	}
    	else if(c==8 && x>0){
			x--;
        	printf("\b \b");
       }
	}while(c!=13 && x<lon);
	numero[x]='\0';
	return atoi(numero);
}

void valitext(int lon,char *pnom){
    int c=0, x=0;
    if (lon <= 0) 
		return;
    pnom[0] = '\0';
    while (1){
        c = getch();
        if (c == 13) {                 // Enter
            break;
        } else if (c == 8) {           // Backspace
            if (x > 0) {
                x--;
                printf("\b \b");
                pnom[x] = '\0';
            }
        } else if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) {
            if (x < lon - 1) {         // deja 1 para '\0'
                pnom[x++] = (char)c;
                pnom[x] = '\0';
                putchar(c);
            }
        }
    }
    printf("\n");
}



main(){
	int opc=0;
	NODOPTR nuevo=NULL;
	NODOPTR inicio=NULL;
	NODOPTR actual=NULL;
	NODOPTR anterior=NULL;
	NODOPTR iniciopa=NULL;
	NODOPTR actualpa=NULL;
	
	do{
		printf("Escoja una opcion: \n1) Agregar \n2) Eliminar \n3) Consultar \n4) Modificar \n5) Salir \n");
		scanf("%i",&opc);
		system("cls");
		
		switch(opc){
			case 1: //agregar
				nuevo = (pila *)malloc(sizeof(pila));
				printf("Ingrese el nombre del libro: ");
				valitext(15, nuevo->nom);
				printf("\nIngrese el nombre del autor: ");
				valitext(15, nuevo->aut);
				printf("\nIngrese el numero de paginas: ");
				nuevo->npag=valinum(3);
								
				nuevo->sig=NULL; 
				if(inicio == NULL)
					inicio=nuevo;
				else{
					nuevo->sig=inicio;
					inicio=nuevo;					
				}	
				system("cls");							
				break;
			
			case 2: {//eliminar
			        if (inicio == NULL) {
			        	printf("No hay libros en la pila.\n");
			        	getch();
			        	break;
			    	}
			
			    char buscado[15];
			    printf("Ingrese el nombre del libro a borrar: ");
			    valitext(15, buscado);   // asegúrate que termina en '\0'
			
			    actual   = inicio;
			    anterior = NULL;
			
			    while (actual != NULL && strcmp(actual->nom, buscado) != 0) {
			        anterior = actual;
			        actual   = actual->sig;
			    }
			
			    if (actual == NULL) {
			        printf("\nNo existe un libro con ese nombre.\n");
			        getch();
			        break;
			    }
			
			    printf("\nEncontrado:\nNombre: %s \nAutor: %s \nPaginas: %i\n",actual->nom, actual->aut, actual->npag);
			    printf("¿Desea eliminarlo? 1)Si  2)No\n ");
			    int opt = valinum(1);
			
			    if (opt == 1) {
			        if (anterior == NULL) {
			            inicio = actual->sig;         
			        } else {
			            anterior->sig = actual->sig; 
			        }
			        free(actual);
			        printf("Eliminado.\n");
			    } else {
			        printf("Cancelado.\n");
			    }
			    getch();
			    break;
			}
			
			case 3: //consultar
				actual = inicio;

			    if (inicio == NULL) {
			        printf("No hay nada en la pila.\n");
			        break;
			    }
			
			    while (actual != NULL) {
			        printf("Nombre: %s \n", actual->nom);
			        printf("Autor: %s \n", actual->aut);
			        printf("Numero de paginas: %i \n", actual->npag);
			
			        if (iniciopa == NULL) {
			            iniciopa = inicio;          
			            actual = actual->sig;      
			            inicio = actual;           
			            iniciopa->sig = NULL;      
			        } else {
			            actualpa = actual;         
			            actual = actual->sig;     
			            inicio = actual;         
			            actualpa->sig = iniciopa; 
			            iniciopa = actualpa; 
			        }
			    }
			
			    while (actualpa != NULL) {			
			        if (inicio == NULL) {
			            inicio = iniciopa;
			            actualpa = actualpa->sig;
			            iniciopa = actualpa;
			            inicio->sig = NULL;
			        } else {
			            actual = actualpa;
			            actualpa = actualpa->sig;
			            iniciopa = actualpa;
			            actual->sig = inicio;
			            inicio = actual;
			        }
			    }
			
			    break;
			
			case 4: { // modificar
			    if (inicio == NULL) {
			        printf("No hay libros en la pila.\n");
			        getch();
			        break;
			    }
			
			    char buscado[15];
			    printf("Ingrese el nombre del libro a modificar: ");
			    valitext(15, buscado); 
			
			    actual   = inicio;
			    anterior = NULL;

			    while (actual != NULL && strcmp(actual->nom, buscado) != 0) {
			        anterior = actual;
			        actual   = actual->sig;
			    }
			
			    if (actual == NULL) {
			        printf("\nNo existe un libro con ese nombre.\n");
			        getch();
			        break;
			    }
			
			    printf("\nEncontrado:\nNombre: %s | Autor: %s | Paginas: %d\n",actual->nom, actual->aut, actual->npag);
			    printf("¿Desea modificarlo? 1)Si  2)No\n> ");
			    int opt = valinum(1);
			
			    if (opt == 1) {
			        printf("\nNuevo nombre: ");
			        valitext(15, actual->nom);
			
			        printf("\nNuevo autor: ");
			        valitext(15, actual->aut);
			
			        printf("\nNuevo numero de paginas: ");
			        actual->npag = valinum(3);
			
			        printf("\nModificado.\n");
			    } else {
			        printf("Cancelado.\n");
			    }
			
			    getch();
			    break;
			}
			
			case 5: //salir
				return 0;
				break;
				
		}
		
		
	}while(opc!=5);
	actual=inicio;
	while(actual!=NULL){
		inicio=inicio->sig;
		free(actual);
		actual=inicio;
		printf("Se libero el espacio\n");
	}
	
}
