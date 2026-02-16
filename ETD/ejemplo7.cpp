#include <stdio.h>

int mcd(int a, int b) {
    if (a < 0) a = -a;
    if (b < 0) b = -b;
    while (b != 0) {
        int r = a % b;
        a = b;
        b = r;
    }
    return a;
}

int main() {
    int x, y;
    printf("Ingrese el valor de x: ");
    scanf("%d", &x);
    printf("Ingrese el valor de y: ");
    scanf("%d", &y);
    printf("Maximo comun divisor = %d\n", mcd(x, y));
}
