
.text
	.globl	main

ft_putchar:
	pushq   %rbp
	movq    %rsp, %rbp
	subq    $16, %rsp
	movl    %edi, %eax
	movb    %al, -4(%rbp)
	leaq    -4(%rbp), %rax
	movl    $1, %edx
	movq    %rax, %rsi
	movl    $1, %edi
	movl    $0, %eax
	call    write
	nop
	leave
	ret
main:
	pushq   %rbp
	movq    %rsp, %rbp
	movl    $65, %edi
	call    ft_putchar
	movl    $0, %eax
	popq    %rbp
	ret
