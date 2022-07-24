	.file	"Colleen.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"#include <stdio.h>%2$c%4$c* Comment outside *%4$c%2$cvoid selfprint() {%2$c%1$cchar *s = %3$c%5$s%3$c;%2$c%1$cprintf(s, 9, 10, 34, 47, s);%2$c}%2$cint main() {%2$c%1$c%4$c* Comment inside *%4$c%2$c%1$cselfprint();%2$c%1$creturn 0;%2$c}%2$c"
	.text
	.globl	selfprint
	.type	selfprint, @function
selfprint:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC0(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %r9
	movl	$47, %r8d
	movl	$34, %ecx
	movl	$10, %edx
	movl	$9, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	selfprint, .-selfprint
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	selfprint
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
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
