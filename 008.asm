global _main

.hello.str:
	.ascii "12345678\n"

.text

_main
	movq %rsp, %rbp
	#write hello world

  