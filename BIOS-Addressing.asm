;Demonstrates that the BIOS places this code at offset 0x7c00 
;org 7c00h ; one way to indicate that all offsets should be calculated from this address

mov ah, 0x0e ;for printing characters
mov bx, character ; load the relative address
add bx, 7c00h ; add offset
mov al, [bx] ;load item at address specified
int 0x10

jmp $ ; infinite loop
character db "F"
times 510 - ($ - $$) db 0
dw 0xaa55
