	.file	"Sully.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"gcc -Wall -Wextra -Werror Sully_%1$d.c -o Sully_%1$d; ./Sully_%1$d"
	.text
	.globl	compile
	.type	compile, @function
compile:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1056, %rsp
	movl	%edi, -1044(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-1044(%rbp), %edx
	leaq	-1040(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	system@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L2
	call	__stack_chk_fail@PLT
.L2:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	compile, .-compile
	.section	.rodata
.LC1:
	.string	"Sully_%d.c"
	.align 8
.LC2:
	.ascii	"#include <fcntl.h>%2$c#include <stdio.h>%2$c#include <stdlib"
	.ascii	".h>%2$c%2$c#define OUTPUT %3$c%5$s%3$c%2$c%2$cvoid compile(i"
	.ascii	"nt num) {%2$c%1$cchar command[1024];%2$c%1$csprintf(command,"
	.ascii	" %3$cgcc -Wall -Wextra -Werror Sully_%%1$d.c -o Sully_%%1$d;"
	.ascii	" ./Sully_%%1$d%3$c, num);%2$c%1$csystem(command);%2$c}%2$c%2"
	.ascii	"$cint main () {%2$c%1$cint i = %4$d;%2$c%1$cchar fileName[10"
	.ascii	"];%2$c%1$cif ("
	.string	"i > 0) {%2$c%1$c%1$csprintf(fileName, %3$cSully_%%d.c%3$c, i - 1);%2$c%1$c%1$cint fd = open(fileName, O_RDWR | O_TRUNC | O_CREAT, 0664);%2$c%1$c%1$cdprintf(fd, OUTPUT, 9, 10, 34, i - 1, OUTPUT);%2$c%1$c%1$ccompile(i - 1);%2$c%1$c}%2$c%1$creturn 0;%2$c}%2$c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$5, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jle	.L4
	movl	-28(%rbp), %eax
	leal	-1(%rax), %edx
	leaq	-18(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-18(%rbp), %rax
	movl	$436, %edx
	movl	$578, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -24(%rbp)
	movl	-28(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-24(%rbp), %eax
	subq	$8, %rsp
	leaq	.LC2(%rip), %rdx
	pushq	%rdx
	movl	%ecx, %r9d
	movl	$34, %r8d
	movl	$10, %ecx
	movl	$9, %edx
	leaq	.LC2(%rip), %rsi
	movl	%eax, %edi
	movl	$0, %eax
	call	dprintf@PLT
	addq	$16, %rsp
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	compile
.L4:
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
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
