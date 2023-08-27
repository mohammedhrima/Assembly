+ 8086/88
+ Instruction decode:
    - mov dest, src
    - example:
        mov ax, bx
          8 bits       2 | 3 | 3 bits
        |100010|DW || mod|reg| r/m
        |100010|11

        + reg    : register
        + r/m    : register or memory       

        + D bit  :
                   if D = 0 -> r/m | reg
                   if D = 1 -> reg | r/m
        + W bit  :
                   if W = 0 -> 8 bits
                   if W = 1 -> 16bits
        + mod    : memory or register operation
                   if mod = 00 -> mem and mem
                   if mod = 11 -> reg and reg
                   if mod = 01 -> mem + [0,  8 bit number]
                   if mod = 10 -> mem + [0, 16 bit number]

+ Homework:
    mov cx, bx
    ...

+ Decoding multiple instructions and suffixes:
    mov bx, [75] ; mov the value stored in address 75 to register bx
                 ; bx means I'm working on 1 byte (8 bits)
                 ; the range that will be accessed [75, 76]
                 ; in case of:
                        bx , [75]; [75, 76]
                        ebx, [75]; [75, 77]
                        rbx, [75]; [75, 79]
    mov [75], bx ; mov the value of bx to value in address 75

    mov bx,[bp + 75] ; an infective address calculation
                     ; check the range [bp, bp+75] and mov the value
                     ; from there to the register bx
    AH | AL = AX
    BH | BL = BX
    CH | CL = CX
    DH | DL = DX
      SP
      BD
      SI
      DI


30:24

















