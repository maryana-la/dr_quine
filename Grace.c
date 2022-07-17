#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
/* Program with no main */

#define FILE open("Grace_kid.c", O_CREAT | O_TRUNC | O_RDWR, 0664)
#define OUTPUT "#include <stdio.h>%c#include <fcntl.h>%c#include <unistd.h>%c%c* Program with no main *%c%c%c#define FILE open(%cGrace_kid.c%c, O_CREAT | O_TRUNC | O_RDWR, 0664)%c#define OUTPUT %c%s%c%c#define START()%c%cint main() {%c%c%cint fd = FILE;%c%c%cif (fd < 0)%c%c%c%creturn -1;%c%c%cdprintf(fd,OUTPUT,10,10,10,47,47,10,10,34,34,10,34,OUTPUT,34,10,92,10,92,10,9,92,10,9,92,10,9,9,92,10,9,92,10,9,92,10,9,92,10,10,10,10);%c%c%cclose(fd);%c%c%creturn 0;%c%c}%c%cSTART()%c"
#define START()\
int main() {\
	int fd = FILE;\
	if (fd < 0)\
		return -1;\
	dprintf(fd,OUTPUT,10,10,10,47,47,10,10,34,34,10,34,OUTPUT,34,10,92,10,92,10,9,92,10,9,92,10,9,9,92,10,9,92,10,9,92,10,9,92,10,10,10,10);\
	close(fd);\
	return 0;\
}

START()
