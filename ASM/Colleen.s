segment .text
global main
extern printf
;Comment outside
main:
	push rbp
	mov rbp, rsp
	call selfprint ; Calling a function
	xor rax,rax
	pop rbp
	ret

selfprint:
	push rbp
	mov rbp, rsp
	mov rdi, msg
	mov rsi, 9
	mov rdx, 10
	mov rcx, 34
	mov r8, msg
	call printf
	leave
	ret

segment .data
msg db "segment .text%2$cglobal main%2$cextern printf%2$c;Comment outside%2$cmain:%2$c%1$cpush rbp%2$c%1$cmov rbp, rsp%2$c%1$ccall selfprint ; Calling a function%2$c%1$cxor rax,rax%2$c%1$cpop rbp%2$c%1$cret%2$c%2$cselfprint:%2$c%1$cpush rbp%2$c%1$cmov rbp, rsp%2$c%1$cmov rdi, msg%2$c%1$cmov rsi, 9%2$c%1$cmov rdx, 10%2$c%1$cmov rcx, 34%2$c%1$cmov r8, msg%2$c%1$ccall printf%2$c%1$cleave%2$c%1$cret%2$c%2$csegment .data%2$cmsg db %3$c%4$s%3$c, 0%2$c", 0
