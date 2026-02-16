  #include <stdio.h>

int funcionepica(int b, int e){
    if (e == 0)
    return 1;
        	return b*funcionepica(b, e-1);
    }
      
    
int main(){
	int b, e; //b simboliza la base y e simboliza el exponente
	int r = 1;

    printf("Ingrese un numero: ");
    scanf("%d", &b);

    printf("Ingresa el exponente (e): ");
    scanf("%d", &e);

    for (int x = 0; x < e; x++) {
        r = r * b;
    }

    printf("%d elevado a la %d es: %d\n", b, e, r);

    return 0;
}





