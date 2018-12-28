#include "../helpers.c"
#include <math.h>

int main(){
	char *x = calloc(5, 1);
	*(x + 1) = 254;
	printf("%x\n", x[1] + 1);
}
