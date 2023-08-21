%include "10-include_file.inc"

section .data
    text db "hello world", 10
 
section .text
    global _start
 
_start:
    print text
    exit