#include "../helpers.c"
#include <math.h>

int main(){
	printf("%d\n", sizeof(int));
	printf("%c\n", '6' + 1 );
	printf("%d\n", 1 << 1);

	printf("%s\n", bitArray(fromRight(10, 3)));
	printf("%s\n", bitArray(appendBits(10, 7, 4)));
	printf("%c\n", 100);
	printArray(hexToInt("123456788abcdef"), 15);
	printArray(hexToInt("123456788abcdef"), 15);
}
