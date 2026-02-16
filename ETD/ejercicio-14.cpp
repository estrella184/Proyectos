#include<stdio.h>
#include<windows.h>
#include<malloc.h>
#include<conio.h>

struct alumnos{
	int mat;
	char nom[10];
	int edad;
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
	        *(pnom+x)='\n';
        }
    }while(c!=13 && x<lon);
    *(pnom+x)='\0';
}

main(){
	int opc=0;
	NODOPTR nuevo=NULL; // Se pudo haber puesto *nodo tmb, crea un espacio de memoria
	NODOPTR inicio=NULL;
	NODOPTR actual=NULL;
	NODOPTR anterior=NULL;
	int *pint;
	do{
		printf("Menu:\n1) Agregar\n2) Borrar\n3) Consultar\n4) Modificar\n5) Salir\nOpcion: ");
		scanf("%i",&opc);
		system("cls");
		switch(opc){
			case 1:
				nuevo=(nodo *)malloc(sizeof(nodo));
				printf("Matricula: ");
				//scanf("%i",&nuevo->mat);
				nuevo->mat=valinum(4);
				printf("\nNombre: ");
				//scanf("%s",&nuevo->nom);
				valitext(10, nuevo->nom);
				printf("\nEdad: ");
				//scanf("%i",&nuevo->edad);
				nuevo->edad=valinum(2);
				nuevo->sig=NULL;
				if(inicio==NULL)
					inicio=nuevo;
				else{
					actual=inicio;
					while(actual->sig!=NULL)
						actual=actual->sig;
					actual->sig=nuevo;
				}
				printf("\n");
				break;
			case 2:
			    int matTemp, opc;
			    if(inicio == NULL){
			        printf("\nNo hay alumnos registrados");
			        break;
			    }
			    actual=inicio;
			    printf("\nMatricula a buscar: ");
			    matTemp = valinum(4);
			    while(actual != NULL){
			        if(actual->mat == matTemp)
			            break;
			        anterior = actual;
			        actual = actual->sig;
			    }
			    if(actual == NULL){
			        printf("\nNo se encontro la matricula %i", matTemp);
			        break;
			    }
			    printf("\nNombre: %s\nEdad: %i\n\nDesea borrarlo\n1) Si \n2) No\nOpcion: ", actual->nom, actual->edad);
			    opc = valinum(1);
			    if(opc == 2)
			        break;
			    if(actual == inicio){
			        inicio = inicio->sig;
			        free(actual);
			        break;
			    }
			    if(actual->sig == NULL){
			        anterior->sig = NULL;
			        free(actual);
			        break;
			    }
			    anterior->sig = actual->sig;
			    free(actual);
			    break;
			case 3:
				actual=inicio;
				printf("Actual\t\t\tMatricula\tNombre\t\tEdad\t\tSiguiente");
				while(actual!=NULL){
					printf("\n%p\t%i\t\t%s\t\t%i\t\t%p",actual,actual->mat,actual->nom,actual->edad,actual->sig);
					actual=actual->sig;
				}
				getch();
				printf("\n");
				break;
			case 4: //BUSCA CON MATRICULA, NO ELIMINA
				actual=inicio;
			    int matElim, opcElim;
			    printf("\nMatricula a buscar: ");
			    matElim = valinum(4);
			    while(actual != NULL){
			        if(actual->mat == matElim)
			            break;
			        else
			            actual=actual->sig;
			    }   
			    if(actual == NULL)
			        printf("\nNo se encuentra la matricula en el sistema");
			    else{
			        printf("\nNombre: %s\nEdad: %i\n\nDesea modificar\n1) Si \n2) No\nOpcion: ", actual->nom, actual->edad);
			        opcElim = valinum(1);
			        if(opcElim == 2)
			            printf("\nNo se modificaron los datos");
			        else if(opcElim == 1){
			            printf("\nNombre: ");
			            valitext(10, actual->nom);
			            printf("\nEdad: ");
			            actual->edad=valinum(2);
			        }
			    }
			    break;
			case 5:
				printf("Salir\n");
				break;
			default: 
				printf("Opcion incorrecta\n");
				break;
		}
		system("pause");
		system("cls");
	}while(opc!=5);
	actual=inicio;
	while(actual != NULL){
		inicio = inicio->sig;
		free(actual);
		actual = inicio;
		printf("Se libero el espacio\n");
	}
}

