+ 8086/88
+ Instruction decode:
    - mov dest, src
    - example:
        mov ax, bx
        | 8 bits | 2 bits | 2 bits | 3 bits | 3 bits
        |  mov   |   DW   |  mod   |  reg   |  r/m
        | 100010 |   11   |        |        |

        + reg    : register
        + r/m    : register or memory       

        + D bit  : source and destination
                   if D = 0 -> src  | dest
                   if D = 1 -> dest | src

        + W bit  :
                   if W = 0 -> 8 bits
                   if W = 1 -> 16bits

        + mod    : memory or register operation
                   if mod = 00 -> mem and mem                        [...]
                   if mod = 11 -> reg and reg 
                   if mod = 01 -> mem + [0,  8 bit number] (DL)      [... + 8]
                   if mod = 10 -> mem + [0, 16 bit number] (DL + DH) [... + 16]

        + mov ax, bx : target the full register
        + mov al, bl : target only the low bit
        + mov ah, bh : target only the hight bit

+ Homework:
    mov cx, bx -> 1000101111001011

+ Decoding multiple instructions and suffixes:
    mov bx, [75] ; mov the value stored in address 75 to register bx
                 ; bx means I'm working on 1 byte (8 bits)
                 ; the range that will be accessed [75, 76]
                 ; in case of:
                        bx , [75]; [75, 76]
                        ebx, [75]; [75, 77]
                        rbx, [75]; [75, 79]
    mov [75], bx ; mov the value of bx to value in address 75

    mov bx, [bp + 75] ; an infective address calculation
                      ; check the value in bp+75 and mov the value
                      ; from there to the register bx
                      ; in case we want to load value from bx to [bp + 75]
                      ; set D to 0 because the value bp+75 can't be incoded
    AH + AL = AX
    BH + BL = BX
    CH + CL = CX
    DH + DL = DX
      SP      Stack Pointer
      BP      Base Pointer
      SI      Source index
      DI      Destination index

+ 8086 Decoder code review: 18:43    




