%macro exit 0
    mov rax, 60
    xor rdi, rdi
    syscall
%endmacro

%macro printDigitSum 2
    mov rax, %1
    add rax, %2
    call _printRAXdigit
%endmacro

section .data
    digit db 0, 10, 0  ; Allocate 3 bytes for the digit buffer

section .text
    global _start

_start:
    printDigitSum 3, 2
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
