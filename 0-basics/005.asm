global _main

section .text
_main:
	mov rax, 0x2000004 ; write system call
	mov rdx, 1
	mov rsi, msg
	mov rdx, len
	syscall

	;to exit
	mov rax, 0x2000001; exit system call
	mov rdi, 0 ; exit code
	syscall

section .data
	msg: db "Hello world",10,0 ; db -> define byte / 0XA is \n
	len: equ $ - msg ; get the lenght of msg 

;section .bss
;	len resb 15