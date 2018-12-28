#include "../helpers.c"

// Arg1: String
// Arg2: What the character 'space' is encoded in
int main(int argc, char *argv[]){
	int len1 = stringLen(argv[1]);
	int len2 = stringLen(argv[2]);
	
	int *hex = hexToInt(argv[1]);
	
	char *string = malloc(len1 + 1);
	string[len1] = '\0';

	int i;
	for(i=0; i < len1; i+=2) {
		char base = hex[i];
		base = appendBits(base, hex[i+1], 4);
		
		string[i / 2] = base ^ argv[2][(i / 2) % len2];
	}

	printf("%s\n", string);
}
