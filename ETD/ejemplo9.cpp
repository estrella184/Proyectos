#include <stdio.h> //PUNTEROS

main(){
			//*: se usa para declarar un puntero
	int x, y, *px, *py;
	x=5;
	px=&x; // 
	printf("La variable x tiene el valor: %i",x); //para ver el valor de x
	printf("\nLa variable x tiene el valor: %p",px); //para ver la dirección de x, ya que se reserva un espacio de memoria
	//%p: para que me pueda guardar la dirección
	
	y=8;
	py=&y;
	printf("\n\nLa variable y tiene el valor: %i",y);
	printf("\nLa variable y tiene el valor: %p",py);
	*py=x;
	printf("\n\nLa variable y tiene el valor: %i",*py);
	printf("\nLa variable y tiene el valor: %p",py);
	
	px=py;
	if(px==py)
		printf("\n\nSon iguales.");
	else
		printf("\n\nSon diferentes.");
	//ejemplo
	*px=50;
	printf("\n\nLa variable y tiene el valor: %i",*py);
	printf("\nLa variable y tiene el valor: %p",py);

	
	
}
