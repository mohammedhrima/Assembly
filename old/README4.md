x86 Assembly
db is used to declare initialized/uninitialized data, 
	example:  msg: db "Hello world!"
			  msg: db ?; uninitialized data

db    0x55                ; just the byte 0x55 
db    0x55,0x56,0x57      ; three bytes in succession 
db    'a',0x55            ; character constants are OK 
db    'hello',13,10,'$'   ; so are string constants 
dw    0x1234              ; 0x34 0x12 
dw    'a'                 ; 0x61 0x00 (it's just a number) 
dw    'ab'                ; 0x61 0x62 (character constant) 
dw    'abc'               ; 0x61 0x62 0x63 0x00 (string) 
dd    0x12345678          ; 0x78 0x56 0x34 0x12 
dd    1.234567e20         ; floating-point constant 
dq    0x123456789abcdef0  ; eight byte constant 
dq    1.234567e20         ; double-precision float 
dt    1.234567e20         ; extended-precision float

buffer:    resb 64 ; reserve 64 byteswordvar: resw 1; reserve a word
wordvar    resw 1  ; reserve o word
realarray: req 10  ; array o ten reals
ymmval:    req 