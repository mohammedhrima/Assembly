stdin	equ 0
stdout	equ 1

sys_read  equ 0
sys_write equ 1
sys_exit  equ 60


section .data
	text db "Hello World", 10, 0

section .text
	global _start

_start:
	mov rax, sys_write
	mov rdi, stdout
	mov rsi, text
	mov rdx, 14
	syscall

	mov rax, sys_exit
	mov rdi, 0
	syscall
