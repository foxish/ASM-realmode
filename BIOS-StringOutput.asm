;String output: more assembly than anything else
org 7c00h ;all offsets should be calculated from this address

mov ah, 0x0e ;for printing characters
mov di, 0    ;loop variable

print: mov bl, [character+di]
mov al, bl ;load item at address specified
int 0x10
inc di     ; pretty obvious stuff (should probably use jnz or something cooler)
cmp bl, 0
jne print


jmp $ ; infinite loop
character db "Foxitocin", 0
times 510 - ($ - $$) db 0
dw 0xaa55
