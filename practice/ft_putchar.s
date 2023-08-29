.globl main

_write:
    mov     $1, %rdi            # set file descriptor
    mov     $1, %rax            # write syscall
    mov     $1, %rdx            # length
    syscall
    ret

ft_putchar:
    push    %rbp                # Save the value of %rbp on the stack
    mov     %rsp, %rbp          # Copy the current value of %rsp to %rbp
    sub     $16 , %rsp          # Allocate space on the stack for local variables

    mov     %rdi    , -4(%rbp)  # Copy the value of %rdi (function argument) to the stack
    lea     -4(%rbp), %rax      # Load the address of the stored argument into %rax
    mov     %rax    , %rsi      # Copy the address to %rsi (second argument for my_write)
    call    _write

    nop                         # No operation (placeholder)
    leave                       # Deallocate the stack frame
    ret                         # Return from the function

main:
    push   %rbp
    mov    %rsp , %rbp
    mov    $97  , %rdi
    call   ft_putchar
    mov    $0   , %rax
    pop    %rbp
    ret

/*
    push rbp to the stack
    mov the value of rbp to rsp
    mov the ascci of 'a' to rdi
    call ft_putchar
        save last postion to rbp
        copy value of rsp to rbp
        sub to take 16 bit from stack
        copy the value from rdi to the address rbp - 4
        load the address rbp -4 to rax
        copy rax value to rsi
        call write
*/