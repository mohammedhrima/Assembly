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
