        .global main

        .text
main:
        # write(1, message, 13)
        mov     $1, %rax                # system call 1 is write
        mov     $1, %rdi                # file handle 1 is stdout
        lea     message(%rip), %rsi     # address of string to output
        mov     $13, %rdx               # number of bytes
        syscall

        # exit(0)
        mov     $60, %rax               # system call 60 is exit
        xor     %rdi, %rdi              # return code 0
        syscall

.section .rodata           # read-only data section
message:
        .ascii  "Hello, World\n"
