#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]){
	int a = geteuid();
	int b = geteuid();

	int x = setreuid(a, b);
	printf("uid: %d\neuid: %d\naccess: %d\n", getuid(), x, access(argv[1], 4));

}
