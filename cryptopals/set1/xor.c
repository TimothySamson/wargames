#include "../helpers.c"

int main(int argc, char *argv[]){
	printf("%s\n%s\n", argv[1], argv[2]);
	int len = stringLen(argv[1]);
	if(len != stringLen(argv[2])){
		error("Strings must be of same size");
	}
	
	int *hex1 = hexToInt(argv[1]);
	int *hex2 = hexToInt(argv[2]);

	int i;
	for(i=0; i < len; i++) {
		printf("%c", intToHex(hex1[i] ^ hex2[i]));
	}
	printf("\n");
}
