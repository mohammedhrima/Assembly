; method 1
mov ax, [bp];
mov bx, [bp + 2];
add ax, bx
add ax, [bp + 2]

; method 2
mov ax, [bp];
add ax, [bp + 2];
