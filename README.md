# Assembly

+ this is my journey towards learning assembly (for fun of course X'D)
#### compilation:
```
	nasm -f elf64 -o exe.o file.asm
```
```
	ld exe.o -o exe
```
```
	./exe
```
#### syntax:
```
	  db  : define byte
	_start: label where the program starts
	.data : where data defined before compilation
	.bss  : allocate memory in stack for future use
	.text : the program
```
+ calling a system call:
```
	 name	| code	| rax	| rdi (fd)  | rsi                 | rdx	   |
	 read	|   0  	|  0	| 0 (stdin) | address in register | length |	 
	 write	|   1  	|  1	| 1 (stdout)| address in register | length |	 
```
```
pointer = register
	rip index pointer
	rsp stack pointer
	rbp stack base pointer
```
```
the control flow of program:
	mov rax, 1;	rip = x
	mov rdi, 1;	rip = x + 1
	mov rsi, text;	rip = x + 2
	mov rdx, 14;	rip = x + 3
	...		rip = x + 4
	...		rip = x + 5
	...		rip = x + 6
```

```
after calling cmp :
	if a == b -> ZF = 1
	if a != b -> ZF = 0
```
```
example 1: jumb if equal
	cmp rax, 23
	je _doThis ; this instruction will be executed if value in rax == 13
example 2: jump if greater than
	cmp rax, 23
	jg _doThis
```

+ value vs reference:
```
	mov rax, rbx	; move the value in rax to rbx
	mov rax, [rbx]	; load the address of rax in rbx
```
+ push or pop value from stack
```
	push, 5 ; push 5 to the stack
	pop rax ; pop 5 from stack to rax
```
+ macros:
```
	%macro <name> <argc>
		...
		<macro body>
		...
	%endmacro
```




