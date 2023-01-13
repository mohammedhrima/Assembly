x86 Assembly (indian guy)

EIP : contains the next instruction to execute

Register:
	small memory storage built into processor
	volatile memory
	x86-32 -> register 32 bits
	x86-64 -> register 64 bits

Registers:
	General purpose registers
	Segment registers
	Flags, EIP
	Floating point unit registers
	Mmx registers
	Xmm registers

General purpose registers:
	EAX: store function return values
	EBX: base ponter to the data section
	ECX: counter for string and loop operations
	EDX: i/o pointer
	ESI: source pointer for string operations
	EDI: destination pointer for string operations
	ESP: stack pointer
	EBP: stack frame base pointer

EIP: pointer to next instruction to be executed (instruction pointer)

POP  : removing element from stack
PUSH : add element to stack

stack grow from higher memory address to lower address ( start from the biguset value of address available and go to 0x0 while etting full)
ESP: points on last element putted on stack / the highest accessible free memory in stack + 1

+ PUSH:
	stack before push:
		0x0012FF6C | 0x0000000B (undefined / not accessible)
		0x0012FF70 | 0x0000000A (undefined / not accessible)
		0x0012FF74 | 0x00000003 <- ESP (ESP now is pointting here)
		0x0012FF78 | 0x00000002
		0x0012FF7C | 0x00000001

	we will use :
		push 0x00000004

	or we can use :
		let's set eax to  0x00000004
		then we call push eax

	stack now:
		0x0012FF6C | 0x0000000B (undefined / not accessible)
		0x0012FF70 | 0x00000004 <- ESP (ESP now is pointting here)
		0x0012FF74 | 0x00000003 
		0x0012FF78 | 0x00000002
		0x0012FF7C | 0x00000001

+ POP:
	stack before pop:
		0x0012FF6C | 0x0000000B (undefined / not accessible)
		0x0012FF70 | 0x00000004 <- ESP (ESP now is pointting here)
		0x0012FF74 | 0x00000003 
		0x0012FF78 | 0x00000002
		0x0012FF7C | 0x00000001

	we will use :
		pop eax -> means whatever address esp is pointing on will be poped and set to eax

	stack now:
		0x0012FF6C | 0x0000000B (undefined / not accessible)
		0x0012FF70 | 0x0000000A (undefined / not accessible)
		0x0012FF74 | 0x00000003 <- ESP (ESP now is pointting here)
		0x0012FF78 | 0x00000002
		0x0012FF7C | 0x00000001

+ Calling  conventions: calling functions
	cdecl : "C declaration" function that push to the stack from the right to the left
		example:
			in c let's declare this function add(num1,num2) / num2 will be stored first in memory then num1
			memory stack will look like:
			   lower address
				|        |
				|        |
				|        |
				|  num1  |
				|  num2  |

	saves the old stack frame pointer and sets up a new stack frame

	+ when function execute:
		video 9 1:27 ???

	+ eax or edx: eax returns the result
		+ main calls a function that returns a value
		+ if value is 32 bits it will be stored in eax
		+ else if value is 64 bits it will be stored in edx and eax

	+ see video 9 again

+ Call instruction:
	EIP : contains the next instruction to execute
	+ instruction execution: while instructions are executing EIP keep moving forward to point to next instruction
		00401010 instruction
		00401011 instruction  <- EIP
		00401013 instruction
		00401018 instruction
		0040101D instruction
		0040101E instruction

	+ when calling function inside c for example
		function:
			00401000 instruction
			.
			.
			.
			.
		main:
			00401010 instruction
			.
			.
			.
			00401013 call 00401000
			00401018 instruction

		+ what happen here is:
			while executing the instructions in main when we get to the line 00401013
			it pushes the address of next instruction to stack 00401018 and ESP will be pointing on this address
			and EIP will be the called address (00401000)
			
	+ see video 11 again

+ MOV instruction
	mov dest,src ; data will be copied from src to dest
	+ MOV instruction forms:
		+ MOV Immediate to register:
			before: eax (contains the value 0xFFFFFFFF)
				mov eax, 11223344h
			after : eax (contains the value 11223344h)
		+ MOV register to register:
			before: eax (contains the value 0x11223344) / ebx (contains the value 0xFFFFFFFF)
				mov ebx, eax
			after : ebx (contains the value 0x11223344)
		+ MOV register to memory:
			before: eax (contains the value 0x11223344) / the value at the memory location 0x10101010 is 0xFFFFFFFF
				mov dword[10101010h], eax
			after: the value at the memory location 0x10101010 will be 0x11223344
                  [] means to treat the value as memory address
		+ MOV memory to register:
			before: eax (contains the value 0xFFFFFFFF) / 0x10101010 (contains the value 0x11223344)
				mov EAX ,[10101010h]
			after: eax (contains the value 0x11223344)
		+ MOV Immediate to memory:
			before: 0x10101010 (contains the value 0xFFFFFFFF)
				mov dword[10101010h],11223344h
			after: 0x10101010 (contains the value 0x11223344)
		+ we can't move value from one memory address to another

+ Stack and Stack frame operation:
	+ program layout:
		main -> function1 -> function2 / main call function1, function1 call function2
		+ memory usage:
				1- start execution from main: main store the local variables on stack
					|                    | Lower address
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|  local variables   | Higher address
				
				2- add Call-Save register to stack because it will call function1
					|                    | Lower address
					|                    |
					|                    |
					|           		 |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|Caller-save register|
					|  local variables   | Higher address
				
				3- push argument that wil be called in function1
					|                    | Lower address
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|                    |
					|function1 arguments | (push from right to left)
					|Caller-save register|
					|  local variables   | Higher address
				
				4- push Caller's saved address (after function1 finish return to main)
					|                    		| Lower address
					|                    		|
					|                    		|
					|                    		|
					|                    		|
					|                    		|
					|                    		|
					|                    		|
					|                    		|
					|caller saved return address|
					|function1 arguments 		| (push from right to left)
					|Caller-save register		|
					|  local variables   		| Higher address
				
				5- start function1
					|                    			| Lower address
					|                    			|
					|                    			|
					|                    			|
					|                    			|
					|                    			|
					|                    			|
					|       local variables     	|
					|save frame pointer of the main	|
					|                    			|
					|  caller saved return address  |
					|     function1 arguments 		| (push from right to left)
					|     Caller-save register		|
					|        local variables   		| Higher address
				
				6- if function1 will use some register there will be put on stack
					|                    			| Lower address
					|                    			|
					|                    			|
					|                    			|
					|                    			|
					|                    			|
					|     caller saved register	 	|
					|       local variables     	|
					|save frame pointer of the main	|
					|                    			|
					|  caller saved return address  |
					|     function1 arguments 		| (push from right to left)
					|     Caller-save register		|
					|        local variables   		| Higher address

				7- function1 will call function2
					|                    			| Lower address
					|                    			|
					|       local variables         |
					|save frame pointer of the func1|
					|                    			|
					| caller saved return address   |
					| argument to pass to function2 |
					|     caller saved register	 	|
					|       local variables     	|
					|save frame pointer of the main	|
					|                    			|
					|  caller saved return address  |
					|     function1 arguments 		| (push from right to left)
					|     Caller-save register		|
					|        local variables   		| Higher address

+ Setting project properties:
	ESP last instruction
	EIP next instruction
	EBP we store the address the we will go back to it after
	+ video 15: to see again

+ C to assembly: (video 15)

	#include <stdio.h>
	int func()
	{
		return 0x22222222;
	}
	int main(void)
	{
		func();
		return 0x11111111;
	}

	1- includes stdio.h
	2- open "int main(){"
	3- call function "func"
	4- func start
	5- func return with value 0x22222222
	6- func ends "}"
	7- go back to main
	8- main return 0x11111111
	9- main ends "}"

	+ we have ESP points on 0x0012FF6C and contains the value 0x004012E8
		1-
			push ebp / push "stack frame pointer" of previous called function (in this case main) to the stack, ESP will automatically points on the address of the location in stack
			mov ebp,esp / put the value (address) stored in ESP to EBP


