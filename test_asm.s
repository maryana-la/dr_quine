;https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux


; VIA int 0x80

;global main
;extern printf
;
;main:
;	mov rdx, len
;	mov rcx, msg
;	mov rbx, 1
;	mov rax, 4 ; number of sys_call
;	int 0x80 ; call kernel
;	mov rax,1
;	int 0x80
;
;segment .data
;msg db "sdsdcsd", 0xa
;len equ $ - msg
;

; VIA SYSCALL

global main
extern printf

main:
	mov rdx, 12
	mov rsi, msg
	mov rdi, 1
	mov rax, 4 ; number of sys_call
	syscall
	mov rax,1
	syscall

segment .data
msg db "sdsdcsd", 0xa
len equ $ - msg


;register mapping for system call invocation using int $0x80 - On both Linux x86 and Linux x86_64
;system call number	eax
;1st parameter	ebx
;2nd parameter	ecx
;3rd parameter	edx
;4th parameter	esi
;5th parameter	edi
;6th parameter	ebp
;result eax
;


;register mapping for system call invocation using syscall - The x86_64 architecture
;system call number	rax
;1st parameter	rdi
;2nd parameter	rsi
;3rd parameter	rdx
;4th parameter	rcx
;5th parameter	r8
;6th parameter	r9
;result	rax
;
;

;
;global main
;main:
;;        # write(1, message, 13)
;	mov 	rax, 1                ;# system call 1 is write
;	mov     rdi, 1                ;# file handle 1 is stdout
;	mov     rsi, message     ;# address of string to output
;	mov     rdx, 12               ;# number of bytes
;	syscall
;
;;        # exit(0)
;        mov     rax, 60               ;# system call 60 is exit
;        xor     rdi, rdi              ;# return code 0
;        syscall
;
;section .data           ;# read-only data section
;message db "Hello, World", 0xa



; %rax is used to store a function’s return value



;global main
;extern printf
;b:
;ret
;;a
;main:push rbp
;mov rdi,l;b
;mov rsi,10
;mov rdx,34
;mov rcx,l
;call printf
;xor rax,rax
;pop rbp
;ret
;l:db"global main%1$cextern printf%1$cb:%1$cret%1$c;a%1$cmain:push rbp%1$cmov rdi,l;b%1$cmov rsi,10%1$cmov rdx,34%1$cmov rcx,l%1$ccall printf%1$cxor rax,rax%1$cpop rbp%1$cret%1$cl:db%2$c%3$s%2$c,0%1$c",0
;


;	push rbp
;	movq rbp, rsp
;Первые две инструкции называются прологом функции или преамбулой.
;Первым делом записываем старый указатель базы в стек, чтобы сохранить его на будущее.
;Потом копируем значение указателя стека в указатель базы.
;После этого %rbp указывает на базовый сегмент стекового фрейма функции main.