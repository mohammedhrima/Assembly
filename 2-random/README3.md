x86 assembly - hello world explained

+ search for linux syscall table
+ db means define byte

system call for

system call for mac os:
	write : 0x2000004
	exit : 0x2000001

functions in assembly are called OPCODE
arguments in assembly are called OPRAND

OPRAND can be :
				Registers
				Memory locations
				Constants

operators:
	move  dest  src
	add/sub     register    value/register
	jump        condition   location