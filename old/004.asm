global _main
extern printf, scanf

section .text
_main:
	push rbp ; the 3 followinng lines is to write (){
	mov rbp, rsp
	sub rsp, 16 ; in this line we are reserving space for our local varibales
	;finishing first part of code

	;write the body

	;printf(msg0);
	xor rax, rax  ; check if rax is clear because printf takes multiple parameters
	lea rdi, [msg0]; first parameter
	call printf 
	
	;scanf(format, &num);
	mov rax, 0 ; clear rax
	lea rdi, [format] ; load the address that we want to format scanf with
	lea rsi, [number] ; set storage to address of x
	call scanf 

	;i = 0;
	mov DWORD [rbp - 4],0; set the local variable i, set 0 to pointer rbp with offset of 4 ??


;write the while loop
;the start of the loop
loop:
	;call printf
	mov rdx, [number]  ; the 3rd parameter, the number that we want to dislay
	mov rsi, [rbp - 4] ; the 2nd parameter, local variable i
	lea rdi, [msg2]    ; the 1st parameter, the string msg
	xor rax, rax
	call printf

	mov rcx, DWORD [number] ; check if rcx is holding a value of a number which it's i
	add DWORD [rbp - 4], 1  ; increment the local varibale i

	cmp [rbp - 4], rcx ; compare i [rbp - 4] with rcx[number]
	jle loop           ; jump to loop in line 29, if i < number


	; the of main
	add rsp, 16 ; two write the last } in main
	leave ; mov rsp rbp, pop rbp
	ret ; the last part the reverse of entry part in main

; declare global varibales
section .data
	msg0: db "Enter  number: ",0 ; 0 stand for \0
	msg2: db "Looping %d of %d",10,0 ; 10 stand for \n, 0 stand for \0
	format: db "%d",0

section .bss
	number resb 4
