#include <stdio.h>
int main() {
	const char *s="#include <stdio.h>int main() {const char *s=;printf(%.18s%c%.12s%c%c%.14s%c%s%c%.1s%c%c%.7s%c%.68s%c%.120s%c%c%.9s%c%.1s, s, 10, s + 18, 10, 9, s + 30, 34, s, 34, s + 44, 10, 9, s + 45, 34, s + 52, 34, s + 120, 10, 9, s + 240, 10, s + 249);return 0;}";
	printf("%.18s%c%.12s%c%c%.14s%c%s%c%.1s%c%c%.7s%c%.68s%c%.120s%c%c%.9s%c%.1s", s, 10, s + 18, 10, 9, s + 30, 34, s, 34, s + 44, 10, 9, s + 45, 34, s + 52, 34, s + 120, 10, 9, s + 240, 10, s + 249);
	return 0;
}
















//#include <stdio.h>
//
///* Comment outside */
//void selfprint() {
//	char *s = "#include <stdio.h>* Comment outside *void selfprint() {char *s = ;printf(%.18s%c%c%c%.19s%c%c%.18s%c%c%.10s%c%s%.1s%c%c%.7s%c%.111s%c%.206s%c%.1s%c%c%.12s%c%c%c%.16s%c%c%c%.12s%c%c%.9s%c%.1s%c, s, 10, 10, 47, s + 18, 47, 10, s + 37, 10, 9, s + 55, 34, s, s + 65, 10, 9, s + 66, 34, s + 73, 34, s + 184, 10, s + 391, 10, 10, s + 392, 10, 9, 47, s + 404, 47, 10, 9, s + 420, 10, 9, s + 432, 10, s + 441, 10);}int main() {*Comment inside*selfprint();return 0;}";
//	printf("%.18s%c%c%c%.19s%c%c%.18s%c%c%.10s%c%s%.1s%c%c%.7s%c%.111s%c%.206s%c%.1s%c%c%.12s%c%c%c%.16s%c%c%c%.12s%c%c%.9s%c%.1s%c", s, 10, 10, 47, s + 18, 47, 10, s + 37, 10, 9, s + 55, 34, s, s + 65, 10, 9, s + 66, 34, s + 73, 34, s + 184, 10, s + 391, 10, 10, s + 392, 10, 9, 47, s + 404, 47, 10, 9, s + 420, 10, 9, s + 432, 10, s + 441, 10);
//}
//
//int main() {
//	/* Comment inside */
//	selfprint();
//	return 0;
//}

//%.18s  s - #include <stdio.h>
//%c 10 \n
//%c 47 /
//%.19s  s + 18 * Comment outside *
//%c 47 /
//%c 10 \n
//%.18s s + 37 void selfprint() {
//%c 10 \n
//%c 9 \t
//%.10s s + 55  char *s =
//%c 34 "
//%s s
//%.1s s + 65  ;
//%c 10 \n
//%c 9 \t
//%.7s s + 66 printf(
//%c 34 "
//%c 34 "
//%.2s s + 73  );
//%c 10 \n
//%.1s s + 75 }
//%c 10 \n
//%c 10 \n
//%.12s s + 76 int main() {
//%c 10 \n
//%c 9 \t
//%c 47 /
//%.16s s + 88  *Comment inside*
//%c 47 /
//%c 10 \n
//%c 9 \t
//%.12s s + 104  selfprint();
//%c 10 \n
//%c 9 \t
//%.9s s + 116 return 0;
//%c 10 \n
//%.1s }
//%c 10 \n



//%c 10 \n
//%c 9 \t


// 92 \
// 47 /
// 42 *
// 34 "
// 10 \n
// 9 \t