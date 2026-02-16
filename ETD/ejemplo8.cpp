#include <stdio.h>
#include <stdlib.h>

int recursivo(int num) {
    if (num==0) {
        return 0;
    }
    printf("%d", num%10);
    return recursivo(num/10);
}

int main(){
	int num, i, opc;

	do{	
		printf("\n");
		printf("1) Sin recursividad\n");
		printf("2) Con recursividad\n");
		printf("3) Salir\n");
		printf("Seleccione una opcion: ");
		scanf("%d", &opc);
		
		switch (opc){
			case 1:
				printf("\nIngrese un numero entero positivo: \n");
				scanf("%d", &num);
	
			for(; num>0;){
				printf("%i", num%10);
				num=num/10;
				}
				printf("\n");
				break;
				
			case 2:
                printf("\nIngrese un numero entero positivo: \n");
                scanf("%d", &num);
                printf("Numero invertido con recursividad: ");
                recursivo(num);
                printf("\n");
                break;

            case 3:
                printf("\nSaliendo...\n");
                break;

            default:
            	
                printf("\nOpcion no valida\n");
        }
        
    } while(opc!=3);
    
    return 0;
}                         

//TIC1437
