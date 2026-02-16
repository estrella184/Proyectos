#include <stdio.h>
#include <windows.h>
int buscar(float num);
main(){
	float data=3.3;
	system("cls");
	printf("Capture un numero de lo siguiente, 1.1,2.3,3.3,10,0.36,6.6,23.36,45.9,87.5,25.6: ");
	scanf("%f", &data);
	int x=buscar (data);
	if(x==-1){
		printf("No se encontro el numero");
	return 0;
	}
	
	
	printf("El numero %0.2f, esta en la posicion %i",data,buscar(data));
}

int buscar(float num){
	float arr[]={1.1,2.3,3.3,10,0.36,6.6,23.36,45.9,87.5,25.6};
	int x;
	for(x=0;x<10;x++){
	if(arr[x]==num)
		return x; 	
	return -1;
	}
}

