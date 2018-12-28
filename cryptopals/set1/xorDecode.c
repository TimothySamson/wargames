#include "../helpers.c"

// Arg1: String
// Arg2: What the character 'space' is encoded in, in hex 
// Arg3: Guess what the most common character is
int main(int argc, char *argv[]){
	int len1 = stringLen(argv[1]);
	int *hex = hexToInt(argv[1]);
	
	char *string = malloc(len1 + 1);
	string[len1] = '\0';
	
	// Figure out the key 
	// encoded = key XOR space
	// key = encoded XOR space
	
	char key = hexToByte(argv[2]) ^ argv[3][0];

	int i;
	for(i=0; i < len1; i+=2) {
		char base = hex[i];
		base = appendBits(base, hex[i+1], 4);
		
		string[i / 2] = base ^ key;
	}

	printf("%s\n", string);
}
