#include "../helpers.c"

// argv1: encoded message
// argv2: key
int main(int argc, char *argv[]) {
	int msgLen = stringLen(argv[1]);
	int keyLen = stringLen(argv[2]);

	char *msg = argv[1];
	char *key = argv[2];

	int i;
	char byte;
	for (i=0; i < msgLen; i += 2){
		byte = hexToByte(msg + i);
		byte = byte ^ key[i/2 % keyLen];
		printf("%c", byte);
	}
}
