	.file	"Grace.c"
	.text
	.section	.rodata
.LC0:
	.string	"Grace_kid.c"
	.align 8
.LC1:
	.ascii	"#include <stdio.h>%2$c#include <fcntl.h>%2$c#include <unistd"
	.ascii	".h>%2$c%4$c* Program with no main *%4$c%2$c%2$c#define FILE "
	.ascii	"open(%3$cGrace_kid.c%3$c, O_CREAT | O_TRUNC | O_RDWR, 0664)%"
	.ascii	"2$c#define OUTPU"
	.string	"T %3$c%6$s%3$c%2$c#define START()%5$c%2$cint main() {%5$c%2$c%1$cint fd = FILE;%5$c%2$c%1$cif (fd < 0)%5$c%2$c%1$c%1$creturn -1;%5$c%2$c%1$cdprintf(fd,OUTPUT,9, 10, 34, 47, 92, OUTPUT);%5$c%2$c%1$cclose(fd);%5$c%2$c%1$creturn 0;%5$c%2$c}%2$c%2$cSTART()%2$c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$436, %edx
	movl	$578, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jns	.L2
	movl	$-1, %eax
	jmp	.L3
.L2:
	movl	-4(%rbp), %eax
	leaq	.LC1(%rip), %rdx
	pushq	%rdx
	pushq	$92
	movl	$47, %r9d
	movl	$34, %r8d
	movl	$10, %ecx
	movl	$9, %edx
	leaq	.LC1(%rip), %rsi
	movl	%eax, %edi
	movl	$0, %eax
	call	dprintf@PLT
	addq	$16, %rsp
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
