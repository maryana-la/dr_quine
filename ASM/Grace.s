segment .data
file db "Grace_kid.s", 0
msg db "segment .data%2$cfile db %3$cGrace_kid.s%3$c, 0%2$cmsg db %3$c%1$s%3$c, 0%2$csegment .bss%2$cfd_out resb 1%2$csegment .text%2$cglobal main%2$cextern dprintf%2$c%%macro FT 0%2$cmain:%2$c%4$cpush rbp%2$c%4$cmov rbp, rsp%2$c%4$copen_file file%2$c%4$ccmp rax, 0%2$c%4$cje error%2$c%4$cmov [fd_out], rax%2$c%4$cwrite_file [fd_out], msg%2$c%4$cmov rdi, [fd_out]%2$c%4$cmov rax, 3%2$c%4$csyscall%2$c%4$cleave%2$c%4$cmov rax, 0%2$c%4$cret%2$cerror:%2$c%4$cleave%2$c%4$cmov rax, -1%2$c%4$cret%2$c%%endmacro%2$c%2$c%%macro open_file 1%2$c%4$cmov rdi, %%1%2$c%4$cmov rsi, 578%2$c%4$cmov rdx, 0664o%2$c%4$cmov rax, 2%2$c%4$csyscall%2$c%%endmacro%2$c%2$c%%macro write_file 2%2$c%4$cmov rdi, %%1%2$c%4$cmov rsi, %%2%2$c%4$cmov rdx, %%2%2$c%4$cmov rcx, 10%2$c%4$cmov r8, 34%2$c%4$cmov r9, 9%2$c%4$ccall dprintf%2$c%%endmacro%2$c%2$cFT ; launch program%2$c", 0
segment .bss
fd_out resb 1
segment .text
global main
extern dprintf
%macro FT 0
main:
	push rbp
	mov rbp, rsp
	open_file file
	cmp rax, 0
	je error
	mov [fd_out], rax
	write_file [fd_out], msg
	mov rdi, [fd_out]
	mov rax, 3
	syscall
	leave
	mov rax, 0
	ret
error:
	leave
	mov rax, -1
	ret
%endmacro

%macro open_file 1
	mov rdi, %1
	mov rsi, 578
	mov rdx, 0664o
	mov rax, 2
	syscall
%endmacro

%macro write_file 2
	mov rdi, %1
	mov rsi, %2
	mov rdx, %2
	mov rcx, 10
	mov r8, 34
	mov r9, 9
	call dprintf
%endmacro

FT ; launch program
