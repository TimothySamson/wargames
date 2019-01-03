#include <stdio.h>
#include <stdlib.h>

char binToAscii(char* binString){
	unsigned char place = 1 << 7;
	char c = 0;
	int pos;
	for(pos=0; pos < 8; pos++){
		c += (binString[pos] - 48) * place;
		place >>= 1;
	}

	return c;
}

int main(int argc, char* argv[]){
	char *string = malloc(argc);
	string[argc-1] = '\0';
	int i;
	for(i=0; i < argc-1; i++){
		string[i] = binToAscii(argv[i+1]);
	}


	printf("%s\n", string);
}
