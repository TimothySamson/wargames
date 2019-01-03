#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int stringLen(char *string);

char b64table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

void error(char *msg){
	fprintf(stderr, "Error: %s\n", msg);
	exit(1);
}

void printArray(int *array, int len){
	int i;
	for (i=0; i<len; i++){
		printf("%d\n", array[i]);
	}
}

// Integer to bits
char *bitArray(int num){
	int width = 8*sizeof(num);
	char *array = malloc(width + 1);
	
	unsigned int mask = 1 << (width - 1);
	int i;
	for(i=0; i < width; i++){
		array[i] = '0' + ((num & mask >> i) != 0);
	}
	return array;
}

void printBits(int bits){
	printf("%s\n", bitArray(bits));
}

void printByte(char byte){
	int width = sizeof(byte) * 8;
	
	unsigned char mask = 1 << (width - 1);
	int i;
	for(i=0; i < width; i++){
		printf("%c", '0' + ((byte & mask >> i) != 0));
	}
}

// Get first nth bit from the right
int fromRight(int num, int n){
	// ones n long, 
	unsigned int mask = (1 << n) - 1 ;
	return num & mask;
}

// append the first nth bits of tail to the base from the right
int appendBits(int base, int tail, int n){
	base = base << n;
	base = base | fromRight(tail, n);
	
	return base;
}

// String of hex to an array of integers
int *hexToInt(char *hex){
	int len = stringLen(hex);

	int *atoi = (int *) malloc(len * sizeof(int));

	int i;
	int a;
	for(i=0; i < len; i++){
		a = (int) hex[i];

		// If a is between 0 and 9
		if(48 <= a && a <= 57)
			a = a - 48;
		// if a is between a and f
		else if(97 <= a && a <= 102)
			a = a - 97 + 10;
		else 
			error("only accepts chars from 0-1, a-f");

		atoi[i] = a;
	}

	return atoi;
}

// Input: 1 - 15
char intToHex(int num){
	if(0 <= num && num <= 9){
		return num + 48;
	} else if (10 <= num && num <= 15)
		return num + 97 - 10;
}

int stringLen(char *string){
	int len;
	for (len=0; string[len] != '\0'; len++) {}
	return len;
}

// Input: 'f0, ad, 33, etc'
char hexToByte(char *hex){
	int* hexArray = hexToInt(hex);
	char base = hexArray[0];
	base = appendBits(base, hexArray[1], 4);

	return base;
}

// Input: 'a', '?', etc
char *byteToHex(char byte){
	char *hexTable = "0123456789abcdef";

	char hex2 = fromRight(byte, 4);
	byte >>= 4;
	char hex1 = fromRight(byte, 4);
	
	char *string = malloc(3);
	string[2] = '\0';

	string[0] = hexTable[hex1];
	string[1] = hexTable[hex2];

	return string;
}

int maxInt(int *intArray, int length){
	int candidate = intArray[0];
	
	int i;
	for(i=1; i < length; i++){
		if(candidate < intArray[i])
			candidate = intArray[i];
	}

	return candidate;
}
