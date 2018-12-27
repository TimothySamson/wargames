#include "../helpers.c"

int main(int argc, char *argv[]){
	char* hexstring = argv[1];

	// find length of hexstring
	int len;
	for (len=0; hexstring[len] != '\0'; len++) {}
	
	int *atoi = hexToInt(argv[1]);
	
	int i;
	
	// TODO: It doesn't pad well. I don't know how to pad. It's weird
	// because it's not in bytes, but in words. Maybe later
	int base;
	for(i=0; i < len; i= i + 3){
		base = atoi[i];
		base = (i+1 < len) ? appendBits(base, atoi[i+1], 4) : 0;
		base = (i+2 < len) ? appendBits(base, atoi[i+2], 4) : 0;
		
		char hold = b64table[fromRight(base, 6)];
		
		base >>= 6;
		printf("%c", b64table[fromRight(base, 6)]);
		printf("%c", hold);

	}
	
}
