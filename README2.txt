A - Z Nasm Assembly 64Bit Programming:

when we use [ ] means we are reading or writing to a memory location

Regiters: internal varibales
	General purpose:
		RAX
		RBX
		RCX
		RDX
	Index registers:
		ECX: counter register , it's used to increment to loop
		ESI: source index 
		RBP: base pointer
		RSP: stack pointer
	Integer registers:
		R8...R15
	
	Details:
		General purpose: 64 bits
			RAX = EAX + EAX => EAX = AX + AX => AX = AL + AH / H: higher byte , L: lower byte
			RBX = EBX + EBX => EBX = BX + BX => BX = BH + BL
			RCX = ECX + ECX => ECX = CX + CX => CX = CH + CL
			RDX = EDX + EDX => EDX = DX + DX => DX = DH + DL

		Index register: 64 bits
			RSI = ESI + ESI => ESI = SI + SI
			RDI = EDI + EDI => EDI = DI + DI
			RBP = EBP + EBP => EBP = BP + BP
			RSP = ESP + ESP => ESP = SP + SP 

		Integer registers: R8..R15
			R8 = R8D + R8D => R8D = R8W + R8W
			R9 = R9D + R9D => R9D = R9W + R9W
			...

Memory: (Effective address)
	it's like pointers in c

Immediate values:
	Numberic constant
	character constant
	string constant
	floating point constant


memory architecture: (virtual memory)
	.stack -> hight memory address (stack goees down while growing) / functions call + local variables + parameters + return address
	 ######
	 ######
	 ######
	 ######
	.heap -> heap goes up while growing
	.data, .bss -> constant variables (initialized / uninitialized)
	.text -> low memory address

+ any instruction that refers to a memory address is using segment register
+ jump, ret, call instructions invoke code section in memory ??
+ push, pop, ret, call using stack segment ??



