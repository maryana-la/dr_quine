#include <stdio.h>
/* Comment outside */
void selfprint() {
	char *s = "#include <stdio.h>%2$c%4$c* Comment outside *%4$c%2$cvoid selfprint() {%2$c%1$cchar *s = %3$c%5$s%3$c;%2$c%1$cprintf(s, 9, 10, 34, 47, s);%2$c}%2$cint main() {%2$c%1$c%4$c* Comment inside *%4$c%2$c%1$cselfprint();%2$c%1$creturn 0;%2$c}%2$c";
	printf(s, 9, 10, 34, 47, s);
}
int main() {
	/* Comment inside */
	selfprint();
	return 0;
}
