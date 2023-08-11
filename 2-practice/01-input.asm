section .bss
    input resb 16

section .text
    global _start

_start:
    mov rax, 0      ; call read_syscall
    mov rdi, 0      ; stdin
    mov rsi, input  ; location
    mov rdx, 16     ; length
    syscall

    mov rax, 1      ; call write_syscall
    mov rdi, 1      ; stdout
    mov rsi, input  ; location
    mov rdx, 16     ; length
    syscall

    mov rax, 60     ; exit_syscall
    mov rdi, 0      ; exit status
    syscall

