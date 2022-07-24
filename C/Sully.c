#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define OUTPUT "#include <fcntl.h>%2$c#include <stdio.h>%2$c#include <stdlib.h>%2$c#include <unistd.h>%2$c%2$c#define OUTPUT %3$c%5$s%3$c%2$c%2$cvoid compile(int num) {%2$c%1$cchar command[1024];%2$c%1$csprintf(command, %3$cgcc -Wall -Wextra -Werror Sully_%%1$d.c -o Sully_%%1$d; ./Sully_%%1$d%3$c, num);%2$c%1$csystem(command);%2$c}%2$c%2$cint main () {%2$c%1$cint i = %4$d;%2$c%1$cchar fileName[10];%2$c%1$csprintf(fileName, %3$cSully_%%d.c%3$c, i);%2$c%1$cif (access(fileName, F_OK ) != -1) {%2$c%1$c%1$ci--; sprintf(fileName, %3$cSully_%%d.c%3$c, i);%2$c%1$c}%2$c%1$cif (i >= 0) {%2$c%1$c%1$csprintf(fileName, %3$cSully_%%d.c%3$c, i);%2$c%1$c%1$cint fd = open(fileName, O_RDWR | O_TRUNC | O_CREAT, 0664);%2$c%1$c%1$cdprintf(fd, OUTPUT, 9, 10, 34, i, OUTPUT);%2$c%1$c%1$ccompile(i);%2$c%1$c}%2$c%1$creturn 0;%2$c}%2$c"

void compile(int num) {
	char command[1024];
	sprintf(command, "gcc -Wall -Wextra -Werror Sully_%1$d.c -o Sully_%1$d; ./Sully_%1$d", num);
	system(command);
}

int main () {
	int i = 5;
	char fileName[10];
	sprintf(fileName, "Sully_%d.c", i);
	if (access(fileName, F_OK ) != -1) {
		i--; sprintf(fileName, "Sully_%d.c", i);
	}
	if (i >= 0) {
		int fd = open(fileName, O_RDWR | O_TRUNC | O_CREAT, 0664);
		dprintf(fd, OUTPUT, 9, 10, 34, i, OUTPUT);
		compile(i);
	}
	return 0;
}
