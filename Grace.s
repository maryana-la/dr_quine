segment .data
file db "Grace_kid.s", 0
msg db "segment .data%2$cfile db %3$cGrace_kid.s%3$c, 0%2$cmsg db %3$c%1$s%3$c, 0%2$csegment .bss%2$cfd_out resb 1%2$csegment .text%2$cglobal main%2$cextern dprintf%2$c%4$cmacro FT 0%2$cmain:%2$c    push rbp%2$c    mov rbp, rsp%2$c    open_file file%2$c    cmp rax, 0%2$c    je error%2$c    mov [fd_out], rax%2$c    write_file [fd_out], msg%2$c    mov rdi, [fd_out]%2$c    mov rax, 3%2$c    syscall%2$c    pop rbp%2$c    ret%2$cerror:%2$c    mov rax, -1%2$c    ret%2$c%4$cendmacro%2$c%2$c%4$cmacro open_file 1%2$c    mov rdi, %4$c1%2$c    mov rsi, 578%2$c    mov rdx, 0664o%2$c    mov rax, 2%2$c    syscall%2$c%4$cendmacro%2$c%2$c%4$cmacro write_file 2%2$c    mov rdi, %4$c1%2$c    mov rsi, %4$c2%2$c    mov rdx, %4$c2%2$c    mov rcx, 10%2$c    mov r8, 34%2$c    mov r9, 37%2$c    call dprintf%2$c%4$cendmacro%2$c%2$cFT ; launch program%2$c", 0
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
    pop rbp
    ret
error:
    mov rax, -1
    pop rbp ; added later
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
    mov r9, 37
    call dprintf
%endmacro

FT ; launch program

; todo add leave
