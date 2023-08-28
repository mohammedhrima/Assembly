default rel
bits 64

section .data
    a dq 5
    b dq 2
    c dq 3

section .bss
    max resq 1
    result resq 1

section .text
global _start

_start:
    mov rax, [a]
    mov rbx, [b]
    cmp rax, rbx
    jnl _else
    mov [max], rbx
    jmp _exit

_else:
    mov [max], rax
    jmp _exit

_exit:
    mov rax, 60
    xor edi, edi
    syscall
