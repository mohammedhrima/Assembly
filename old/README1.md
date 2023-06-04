X86 NASM Assembly crash course:
XOR : only one of them

+ section.data:
	- declare initialized data or constants

+ section.bss:
	- declare variables

+  text section:
	- contains the actual code
	- begin with: global _start (the beginning of code)
		syntax:
			section.text
				global _start
			_start:
	- comments: ;some comment

+ syntax of assembly langauge statements:
		INC COUNT:      increment the memory variable COUNT
		MOV TOTAL, 48:  transfer the value 48 in the memory varibale TOTAL
		ADD AH, BH:     add the content of the register BH to AH
		AND MASK1, 128: perfom AND operator on the variables MASK1 and 128
		ADD MARKS, 10:  add 10 to the variables MARKS
		MOV AL, 10:     transfer the value 10 to the AL register

+ compilling:
		+ we use _start or _main: as section .bss depend on compiler
		+ nasm (assembler) : convert asm to machine code (.o file)
		+ ld -> link the code :
													+ ld look for _start because it's here entry point
													+ turn .o file to executable (you should specify the architecture (-fmacho64) and size of memory)
		nasm -fmacho64 helloworld.asm
		ld helloworld.o -o hello -macosx_version_min 10.13 -lSystem
		./hello

+ Registers:
		rax are used for 64bit register
		eax are used for 32bit register

		32 bits architecture:
			EAX = AX + AX | AX = AH + AL
			EBX = BX + BX | BX = BH + BL
			ECX = CX + CX | CX = CH + CL
			EDX = DX + DX | DX = DH + DL

			ESI           | ESI = source index 
			EDI           | EDI = destination index
			ESP           | ESP = stack pointer (1st address in stack) / changes depends if I add or remove data from stack
			EBP           | EBP = base pointer (last address in stack)

		RAX (used in 64 bits): contains 2 EAX (sizeof EAX 32 bits)
		EAX : contains 2 AX (sizeof AX 16 bits)
		AX  : contains AH and AL / AH(sizeof AH 8 bits) + AL(sizeof AL 8 bits)

		ECX: counter register , it's used to increment to loop
		ESI: source index 
		EDI: destination index
		ESP: stack pointer (1st address in stack) / changes depends if I add or remove data from stack
		EBP: base pointer (last address in stack)

		+ When ESP == EBP : that means that the stack is full

+ Instruction:
		mv dest, src: it copy data from src address to dest address
		
		movzx: put zero in the unused byte
				  example:	movzx eax,3 -> put binary version of 3 (3 in binary = 11) in 32 register and put 0 in the rest of bits
		
		movsx: to see after in (17:36)
		
		BITWISE OPERATOR:
			and dest, src: take two operands and look bit by bit and do & operation
			or dest, src:
			xor dest, src:
			test eax, eax: check if the two operands are the same
		
		add eax, ebx: eax = eax + ebx
		sub eax, 15: eax = eax - 15

		multiplication:
			mov ax, 15
			mul bx: dx:ax = ax * bx   // we did add dx , program always store the result in ax register , but if we get result more than what 32bit register can suport it will be storred in dx
		
		devide:
			mov ax, 15
			div bx ; ax Rdx = dx:ax / bx // the result will be stored in ax and the remineder wil be stored in dx

+ Flag register: each bit means something
		CF: carry flag bit (1 -> yes, 0 -> no)
		OF: overflow flag
		ZF: zero flag (1 -> yes, 0 -> no) ,if the result of your operation ends in zero 15 - 15 = 0
		SF: sign flag , tf the resulat is negative (1 -> is negative, 0 -> is positive)
		PF: prity flag, (even , odd)
		...

+ jump oeration:
		jump labell 
		je label (jump if equal)
		jne label (jump if not equal)
		jz (jump if zero)
		jnz (jf if not zero)
		...

+ call:
		call label:
					example: in this c code
										int a = 3;
										int b = 5;
										printf('Hello');
									when it will be converted to machine code, label will point on the line whereis printf and save the location
	
		push rip: go to where rip is pointing then go back to code and continue
	
		jmp label: (to see after 29:24)
					
		- to go back from where we did went when we did call push we write
			ret 
				pop rip: remove the address of the next line of code that we did put in the stack and put it in rip
		
last time (30:10) 


























