%macro exit 0
    mov rax, 60
    xor rdi, rdi
    syscall
%endmacro

%macro printDigit 1
    mov rax, %1
    call _printRAXdigit
%endmacro

section .data
    digit db 0, 10, 0  ; Allocate 3 bytes for the digit buffer

section .text
    global _start

_start:
    printDigit 3
    printDigit 5
    exit

_printRAXdigit:
    add al, 48
    mov [digit], al
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret
