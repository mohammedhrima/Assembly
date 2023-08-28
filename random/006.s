.section .data
    a: .byte 'a'
    b: .byte 'b'
    c: .byte 'c'

.section .text
    .global main
    .type main, @function

main:
    movq    $1, %rax          # syscall number for write
    movq    $1, %rdi          # file descriptor (stdout)
    leaq    b(%rip), %rsi     # address of 'c'
    movq    $1, %rdx          # message length
    syscall

    xor     %eax, %eax        # Return 0
    ret
