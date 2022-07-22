segment .data
file db "Grace_kid.s", 0

;%macro FT 0
;
;
;
;%endmacro


%macro write_file 2
	mov rdi, %1
	mov rsi, %2
	mov rdx, 9
	mov rcx, 10
	mov r8, 34
	call dprintf
%endmacro

segment .text


global main
extern dprintf

main:
	push rbp
	mov rbp, rsp

	mov rdi, file ;prepare params for open
	mov rsi, 578 ;open flags
	mov rdx, 0664o ; open rights
	mov rax, 2 ; sys_call number
	syscall
	cmp rax, byte 0	;	if rax == NULL
	je  error		;	go to error section

	mov [fd_out], rax

	write_file [fd_out], msg

	mov rdi, [fd_out]
	mov rax, 3 ; close(fd)
	syscall

	pop rbp
	ret

error:
	mov rax, -1			;	rax = -1
	ret

segment .data
msg db "segment .data%1$cfile db %3$cGrace_kid.s%3$c, 0", 0

segment .bss
fd_out resb 1

;
;; Макрос с двумя параметрами, который реализует системный вызов sys_write
;   %macro write_string 2
;      mov   eax, 4
;      mov   ebx, 1
;      mov   ecx, %1
;      mov   edx, %2
;      int   80h
;   %endmacro
;
;section	.text
;   global main            ; объявляем для использования gcc
;
;main:                     ; сообщаем линкеру входную точку
;   write_string msg1, len1
;   write_string msg2, len2
;   write_string msg3, len3
;
;   mov eax,1                ; номер системного вызова (sys_exit)
;   int 0x80                 ; вызов ядра
;
;section	.data
;msg1 db	'Hello, programmers!',0xA,0xD
;len1 equ $ - msg1
;
;msg2 db 'Welcome to the world of,', 0xA,0xD
;len2 equ $- msg2
;
;msg3 db 'Linux assembly programming! '
;len3 equ $- msg3