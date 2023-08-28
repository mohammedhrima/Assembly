section .data
    c db 'a', 0

section .text
    global _start

_start:
    mov rax, c
    call _putchar
    call _exit

_putchar:
    mov rsi, rax
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall
    ret

_exit:
    mov rax, 60
    mov rdi, 0
    syscall
    ret