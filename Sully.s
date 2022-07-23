segment .text
global main
extern sprintf
extern dprintf
extern system
extern printf

main:
	push rbp
	mov rbp, rsp
	mov rax, 5
	cmp rax, 0
	je endprogram
	dec rax

	mov r12, rax

;create string with file name
	mov rdi, filename
	mov	rsi, sully
	mov rdx, r12
	call sprintf

; sout filename
	mov rdi, 1
	mov rsi, filename
	mov rdx, 9
	mov rax, 1
	syscall

	; test start
	mov rdi, msg
	mov rsi, msg
    mov rdx, 10
    mov rcx, 34
    mov r8, r12
    call printf
;    ; test end
;
; create or open file
	mov rdi, filename
	mov rsi, 578
	mov rdx, 0664o
	mov rax, 2
	syscall
;
;
;
	mov [fd_out], rax
;
; write file
	mov rdi, [fd_out]
	mov rsi, msg
    mov rdx, msg
    mov rcx, 10
    mov r8, 34
;    pop r9
    mov r9, r12
    call dprintf
;
	call compile
;	mov rdi, cmd_exec
;	mov rsi, compileCMD
;	mov rdx, r12
;	call sprintf
;
;; sout cmd_exec
;	mov rdi, 1
;	mov rsi, cmd_exec
;	mov rdx, 100
;	mov rax, 1
;	syscall
;
;	mov rdi, cmd_exec
;	call system
;

; close file
	mov rdi, [fd_out]
	mov rax, 3
	syscall

; end of program
	pop rbp
	mov rax, 0
	ret


endprogram:
	leave
	ret

compile:
	push rbp
	mov rbp, rsp
	mov rdi, cmd_exec
	mov rsi, compileCMD
	mov rdx, r12
	call sprintf

	mov rdi, cmd_exec
	call system
	leave
	ret


segment .bss
fd_out resb 1
cmd_exec resb 1024


segment .data
filename TIMES 10 DW 0
compileCMD db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o; gcc Sully_%1$d.o -no-pie -o Sully_%1$d; ./Sully_%1$d", 0xa
sully db "Sully_%d.s", 0
msg db "%2$ccou-cou%3$cline2%3$csdcsdl%%1number%4$d   %1$s", 0
