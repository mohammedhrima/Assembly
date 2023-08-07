compiling:
	nasm -f elf64 -o exe.o file.asm
	ld exe.o -o exe
	./exe

db: define byte

_start: named label ._

.data: where data defined before compilation
.bss : allocate memory for futre use in stack
.text: the code

     syscall	| rax	| rdi	| rsi		| rdx		|
     1 (write)  | 1	| fd (1)| address	| length	|	 

pointer = register
	rip index pointer
	rsp stack pointer
	rbp stack base pointer

the control flow:
	mov rax, 1;	rip = x
	mov rdi, 1;	rip = x + 1
	mov rsi, text;	rip = x + 2
	mov rdx, 14;	rip = x + 3
	...		rip = x + 4
	...		rip = x + 5
	...		rip = x + 6

jmp: jump
cmp: compare

after calling cmp :
	a == b -> ZF = 1
	a != b -> ZF = 0

example 1:
	cmp rax, 23
	je _doThis ; this instruction will be executed if value in rax == 13

example 2:
	cmp rax, 23
	jg _doThis

+ to treat register as value
	mov rax, rbx	; move the value in rax to rbx
	mov rax, [rbx]	; load the address of rax

+ push, pop

+ macros:
	%macro <name> <argc>
		...
		<macro body>
		...
	%endmacro













