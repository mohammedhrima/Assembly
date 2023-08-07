%macro print 1
    mov rax, %1
    mov rbx, 0
%%printLoop:
    mov cl, [rax]
    cmp cl, 0
    je %%endPrintLoop
    inc rbx
    inc rax
    jmp %%printLoop
%%endPrintLoop:
    mov rax, SYS_WRITE
    mov rdi, STDIN
    mov rsi, %1
    mov rdx, rbx
    syscall
%endmacro
 
%macro exit 0
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall
%endmacro

SYS_WRITE equ 1
SYS_EXIT equ 60
STDIN equ 0