segment .text
global main
extern printf

main:
	push rbp
	mov rbp, rsp
	mov rdi, msg
	mov rsi, 97 ; ascii \n
	mov rdx, 98 ; ascii \t
	mov rcx, 99
	call printf
	xor rax,rax
	pop rbp
	ret

segment .data
msg db "hello %c sasda %c sdsd %c", 0



;	push rbp
;	movq rbp, rsp
;Первые две инструкции называются прологом функции или преамбулой.
;Первым делом записываем старый указатель базы в стек, чтобы сохранить его на будущее.
;Потом копируем значение указателя стека в указатель базы.
;После этого %rbp указывает на базовый сегмент стекового фрейма функции main.