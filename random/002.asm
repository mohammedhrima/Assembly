section .data
    buf db 'a', 'b', 'c', 0   ; Null-terminated string 'abc'

section .text
    global _start

_read:
    mov rax, 0       ; syscall number for read
    mov rdi, 0       ; file descriptor (stdin)
    lea rsi, buf   ; buffer address
    mov rdx, 1       ; buffer size
    syscall
    ret

_putchar:
    mov rax, 1       ; syscall number for write
    mov rdi, 1       ; file descriptor (stdout)
    mov rsi, buf     ; address of the character 'c' from rdi
    mov rdx, 1       ; message length
    syscall
    ret

_exit:
    mov rax, 60
    mov rdi, 0
    syscall

_start:
    call _read
    call _putchar
    call _exit
    
