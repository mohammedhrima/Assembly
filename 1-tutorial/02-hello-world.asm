section .data
	text db "hello world", 10

section .text
	global _start

_start:
	call _printHello
	call _exit

_printHello:
	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 14
	syscall
	ret

_exit:
	mov rax, 60
	mov rdi, 0
	syscall
	ret
