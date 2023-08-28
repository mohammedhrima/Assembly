section .data
	text db "hello, World", 10	; 10 stand for nes line, 0 stand for \0
					; db define byte

section .text
	global _start

_start:
	mov rax, 1	; sys_write
	mov rdi, 1	; STDOUT
	mov rsi, text	; pointer
	mov rdx, 14	; length
	syscall

	mov rax, 60	; exit
	mov rdi, 0	; exit code
	syscall
