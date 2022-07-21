#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
/* Program with no main */

#define FILE open("Grace_kid.c", O_CREAT | O_TRUNC | O_RDWR, 0664)
#define OUTPUT "#include <stdio.h>%2$c#include <fcntl.h>%2$c#include <unistd.h>%2$c%4$c* Program with no main *%4$c%2$c%2$c#define FILE open(%3$cGrace_kid.c%3$c, O_CREAT | O_TRUNC | O_RDWR, 0664)%2$c#define OUTPUT %3$c%6$s%3$c%2$c#define START()%5$c%2$cint main() {%5$c%2$c%1$cint fd = FILE;%5$c%2$c%1$cif (fd < 0)%5$c%2$c%1$c%1$creturn -1;%5$c%2$c%1$cdprintf(fd,OUTPUT,9, 10, 34, 47, 92, OUTPUT);%5$c%2$c%1$cclose(fd);%5$c%2$c%1$creturn 0;%5$c%2$c}%2$c%2$cSTART()%2$c"
#define START()\
int main() {\
	int fd = FILE;\
	if (fd < 0)\
		return -1;\
	dprintf(fd,OUTPUT,9, 10, 34, 47, 92, OUTPUT);\
	close(fd);\
	return 0;\
}

START()
