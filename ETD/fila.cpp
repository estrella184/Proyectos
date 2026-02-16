#include <stdio.h> //Fila
#include <windows.h>
#include <malloc.h> //estructura dinamica //para reservar espacio de memoria //solamente se usa para punteros
#include <conio.h>

//. para una estructura estatica
//-> para una estructura dinamica

struct alumnos{
	int matricula;
	char nombre[10];
	int edad;
	//puntero de tipo struct alumnos
	struct alumnos *sig;
};
typedef struct alumnos nodo;
typedef nodo *NODOPTR;

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
    do{
		c=getch();
        if(c>=65 && c<=90 || c>=97 && c<=122 || c==32 || c==164 || c==165){
			printf("%c",c);
            *(pnom+x)=c;
            x++;
        }
        if(c==8 && x>0){
			x--;
		    printf("\b \b");
	        *(pnom+x)=' ';
        }
    }while(c!=13 && x<lon);
}

main(){
	int opc=0;
	NODOPTR nuevo=NULL;
	NODOPTR inicio=NULL;
	NODOPTR actual=NULL;
    do{
        printf("\n\n1. Agregar");
        printf("\n2. Borrar");
        printf("\n3. Consultar");
        printf("\n4. Modificar");
        printf("\n5. Salir");
        printf("\nElige una opcion: ");
        scanf("%i", &opc);
        system("cls");
        switch(opc) {
            case 1:
            	nuevo=(nodo *)malloc(sizeof(nodo));
            	printf("Matricula: ");
            	//scanf("%i", &nuevo->matricula);
            	nuevo->matricula=valinum(4);
            	printf("\nNombre: ");
            	//scanf("%s", &nuevo->nombre);
            	valitext(10,nuevo->nombre);
            	printf("\nEdad: ");
            	//scanf("%i", &nuevo->edad);
            	nuevo->edad=valinum(2);
            	nuevo->sig=NULL;
            	if(inicio==NULL)
            		inicio=nuevo;
            	else{
            		actual=inicio;
            		while(actual->sig!=NULL){
            			actual=actual->sig;
					}
					actual->sig=nuevo;
				}
                break;
            case 2:
                break;
            case 3:
            	actual=inicio;
            	printf("Actual\t\t\tMatricula\tNombre\t\tEdad\tSiguiente");
            	while(actual!=NULL){
            		printf("\n%p\t%i\t\t%s\t%i\t%p",actual,actual->matricula,actual->nombre,actual->edad,actual->sig);
            		actual=actual->sig;
				}
				getch(); //hace la espera de que el usuario presione la tecla para continuar
                break;
            case 4:
                break;
            case 5:
                break;
            default:
            	printf("");
        }
    } while(opc!=5);
    actual=inicio;
    while(actual!=NULL){
    	inicio=inicio->sig;
    	free(actual);
    	actual=inicio;
    	printf("Libero el espacio\n");
	}
}
