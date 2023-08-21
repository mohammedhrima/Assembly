global _main

section .text

_main:
	mov rax,  0x2000004 ; write system call
	mov rdi, 1 ; stdout
	mov rsi, msg ; address of string to output
	mov rdx, 13
	syscall ; call syscall

	mov rax,  0x2000001 ; exit syscall
	mov rdi, 0 ; exit code
	syscall

section .data
	msg: db "Hello World",10,0

