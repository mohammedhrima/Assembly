	.file	"main.c"
	.text
	.globl	main

ft_strlen:
	pushq	%rbp
	mov	%rsp, %rbp
	mov	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	mov	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L3
	movl	-4(%rbp), %eax
	pop	%rbp
	ret

.LC0:
	.string	"abc"
main:
	pushq	%rbp
	mov	%rsp, %rbp
	lea	.LC0(%rip), %rax
	mov	%rax, %rdi
	call	ft_strlen
	pop	%rbp
	ret
