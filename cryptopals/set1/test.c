#include "../helpers.c"
#include <math.h>

int main(){
	int i;
	for(i=0; i < 256; i++){
		printf("%d - %s\n", i, byteToHex((char) i));
	}
}
