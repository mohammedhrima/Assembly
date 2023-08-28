section .data
	c db 'a', 0; declare charatcer c

section .text
	global _start

_start:
	mov rax, 1; write syscall
	mov rdi, 1; output
	mov rsi, c; register
	mov rdx, 1; number of bytes
	syscall

	mov rax, 60; exit syscall
	mov rdi, 0 ; exit code
	syscall


	
