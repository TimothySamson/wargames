#include "../helpers.c"

int numberOfOnes(char byte){
	int width = sizeof(byte) * 8;
	char mask = 1;
	
	int number = 0;
	int i;
	for(i=0; i < width; i++){
		number += (mask & byte) != 0;
		mask <<= 1;
	}

	return number;
}

int hammingDistance(char char1, char char2){
	char xor = char1 ^ char2;
	return numberOfOnes(xor);
}

// looks for the second argument's end
int stringDistance(char *base, char *repeat){
	int distance = 0;
	int i;
	for(i=0; repeat[i] != '\0' && base[i] != '\0'; i++){
		distance += hammingDistance(base[i], repeat[i]);
	}

	return distance;
}

int main(int argc, char* argv[]){
	char *message = argv[1];
	
	int lengths[40];

	int i;
	for(i = 0; i <= 39; i++){}
}	







