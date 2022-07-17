#include <stdio.h>
/* Comment outside */
void selfprint() {
	char *s = "#include <stdio.h>%c%c* Comment outside *%c%cvoid selfprint() {%c%cchar *s = %c%s%c;%c%cprintf(s, 10, 47, 47, 10, 10, 9, 34, s, 34, 10, 9, 10, 10, 10, 9, 47, 47, 10, 9, 10, 9, 10, 10);%c}%cint main() {%c%c%c* Comment inside *%c%c%cselfprint();%c%creturn 0;%c}%c";
	printf(s, 10, 47, 47, 10, 10, 9, 34, s, 34, 10, 9, 10, 10, 10, 9, 47, 47, 10, 9, 10, 9, 10, 10);
}
int main() {
	/* Comment inside */
	selfprint();
	return 0;
}
