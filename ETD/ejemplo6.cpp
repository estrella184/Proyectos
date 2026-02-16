#include <stdio.h> 

int primo(int n, int x);

main(){
	int num=9;
	
	//for(int x=2; x<num; x++)
	//	if(num% x==0){
	//		primo=1;
	//		break;
	//	}
	if(primo(num,2)==1)
		printf("NO");
	else
		printf("SI");
}

int primo(int n, int x){
	if(x>=n)
		return 0;
	if (n%x==0)
		return 1;
	return primo(n, x+1);
	}
