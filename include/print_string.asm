;function to print string starting at address present in register dx until a null character is encountered
print_string: 
mov ah, 0x0e ;for printing characters
pusha
mov di, 0    ;loop variable
mov bx, dx
loop:
    mov al, [bx+di]     ;load item at address specified
    int 0x10
    inc di              ;pretty obvious stuff (should probably use jnz or something cooler)
    cmp al, 0
    jne loop
popa
ret
