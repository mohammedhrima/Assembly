	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movq	_msg0(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	_format(%rip), %rdi
	leaq	_num(%rip), %rsi
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	movl	$0, -8(%rbp)
	movl	%eax, -16(%rbp)         ## 4-byte Spill
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	_msg1(%rip), %rdi
	movl	-8(%rbp), %esi
	movl	_num(%rip), %edx
	movb	$0, %al
	callq	_printf
	movl	-8(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -8(%rbp)
	movl	%eax, -20(%rbp)         ## 4-byte Spill
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	cmpl	_num(%rip), %eax
	jl	LBB0_1
## %bb.3:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Enter a number: "

	.section	__DATA,__data
	.globl	_msg0                   ## @msg0
	.p2align	3
_msg0:
	.quad	L_.str

	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.asciz	"Looping %d of %d\n"

	.section	__DATA,__data
	.globl	_msg1                   ## @msg1
	.p2align	3
_msg1:
	.quad	L_.str.1

	.section	__TEXT,__cstring,cstring_literals
L_.str.2:                               ## @.str.2
	.asciz	"%d"

	.section	__DATA,__data
	.globl	_format                 ## @format
	.p2align	3
_format:
	.quad	L_.str.2

	.globl	_num                    ## @num
.zerofill __DATA,__common,_num,4,2

.subsections_via_symbols
