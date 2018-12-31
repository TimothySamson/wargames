#include "../helpers.c"

// Arg1: String
// Arg2: Key
int main(int argc, char *argv[]){
	int len1 = stringLen(argv[1]);
	int len2 = stringLen(argv[2]);
	
	int i;
	for(i=0; i < len1; i++) {
		char byte = argv[1][i] ^ argv[2][i % len2];
		printf("%s", byteToHex(byte));
	}

}
