section .data
    msg db "c", 0

section .text
    global _start

ft_putchar:
    mov rax, 1         ; syscall number for sys_write
    mov rdi, 1         ; file descriptor (1 for stdout)
    mov rsi, rbx       ; pointer to the character to print
    mov rdx, 1         ; length
    syscall
    ret

exit:
    mov rax, 60        ; exit syscall
    xor rdi, rdi       ; exit code
    syscall
    ret

_start:
    lea rbx, [msg]     ; load the address of the character
    call ft_putchar
    call exit
