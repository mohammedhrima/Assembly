section .data
	text db "hello, World",10,0

section .text
	global _start

_start:
	mov rax, text
	call _print
	call _exit

_print:
	push rax    ; push the value of rax to the stack
	mov rbx, 0  ; set rbx to 0

_loop:
	inc rax         ; inc rax till finding \0
	inc rbx		    ; will used to calculate length
	mov cl, [rax]   ; 
	cmp cl, 0       ; check if we reached \0
	jne _loop

	mov rax, 1      ; call sys_write
	mov rdi, 1      ; set stdout as fd
	pop rsi         ; pop the value from stack to rsi
	mov rdx, rbx    ; mov value from rbx to rdx
	syscall	        ; wich it's the length
	ret

_exit:
	mov rax, 60
	mov rdi, 0
	syscall
	ret