.section .text
    .global main
    .type main, @function

ft_putchar:
    mov     %edi, %eax         # Copy character to %eax
    movb    %al, -4(%rsp)       # Store the lower 8 bits on the stack
    lea     -4(%rsp), %rsi      # Load address of the stored character
    movl    $1, %edx            # Message length (1 byte)
    movl    $1, %edi            # File descriptor (stdout)
    call    write               # Call the write syscall
    ret

main:
    movl    $'c', %edi           # Pass character 'c' to ft_putchar
    call    ft_putchar

    xor     %eax, %eax           # Return 0
    ret
