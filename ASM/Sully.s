%define NUMBER 5
segment .text
global main
extern sprintf
extern dprintf
extern system
extern access
%macro set_filename 1
    mov rdi, filename
    mov rsi, sully
    mov rdx, %1
    call sprintf
%endmacro
main:
    push rbp
    mov rbp, rsp
    mov rax, NUMBER
    cmp rax, 1
    jl endprogram
    mov r12, rax
    set_filename r12
;check if file exists
    mov rdi, filename
    mov rsi, 0
    call access
    cmp rax, 0
    jne open_file
    dec r12
    set_filename r12
    open_file:
; create or open file
    mov rdi, filename
    mov rsi, 0102o
    mov rdx, 0666o
    mov rax, 2
    syscall
    mov [fd_out], rax
; write in file
    mov rdi, [fd_out]
    mov rsi, msg
    mov rdx, msg
    mov rcx, 10
    mov r8, 34
    mov r9, r12
    call dprintf
; compile function
    call compile
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
compileCMD db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o; gcc Sully_%1$d.o -no-pie -o Sully_%1$d; rm Sully_%1$d.o; ./Sully_%1$d", 0
sully db "Sully_%d.s", 0
msg db "%%define NUMBER %4$d%2$csegment .text%2$cglobal main%2$cextern sprintf%2$cextern dprintf%2$cextern system%2$cextern access%2$c%%macro set_filename 1%2$c    mov rdi, filename%2$c    mov rsi, sully%2$c    mov rdx, %%1%2$c    call sprintf%2$c%%endmacro%2$cmain:%2$c    push rbp%2$c    mov rbp, rsp%2$c    mov rax, NUMBER%2$c    cmp rax, 1%2$c    jl endprogram%2$c    mov r12, rax%2$c    set_filename r12%2$c;check if file exists%2$c    mov rdi, filename%2$c    mov rsi, 0%2$c    call access%2$c    cmp rax, 0%2$c    jne open_file%2$c    dec r12%2$c    set_filename r12%2$c    open_file:%2$c; create or open file%2$c    mov rdi, filename%2$c    mov rsi, 0102o%2$c    mov rdx, 0666o%2$c    mov rax, 2%2$c    syscall%2$c    mov [fd_out], rax%2$c; write in file%2$c    mov rdi, [fd_out]%2$c    mov rsi, msg%2$c    mov rdx, msg%2$c    mov rcx, 10%2$c    mov r8, 34%2$c    mov r9, r12%2$c    call dprintf%2$c; compile function%2$c    call compile%2$c; close file%2$c    mov rdi, [fd_out]%2$c    mov rax, 3%2$c    syscall%2$c; end of program%2$c    pop rbp%2$c    mov rax, 0%2$c    ret%2$c%2$cendprogram:%2$c    leave%2$c    ret%2$c%2$ccompile:%2$c    push rbp%2$c    mov rbp, rsp%2$c    mov rdi, cmd_exec%2$c    mov rsi, compileCMD%2$c    mov rdx, r12%2$c    call sprintf%2$c    mov rdi, cmd_exec%2$c    call system%2$c    leave%2$c    ret%2$c%2$csegment .bss%2$cfd_out resb 1%2$ccmd_exec resb 1024%2$c%2$csegment .data%2$cfilename TIMES 10 DW 0%2$ccompileCMD db %3$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o; gcc Sully_%%1$d.o -no-pie -o Sully_%%1$d; rm Sully_%%1$d.o; ./Sully_%%1$d%3$c, 0%2$csully db %3$cSully_%%d.s%3$c, 0%2$cmsg db %3$c%1$s%3$c, 0%2$c", 0
