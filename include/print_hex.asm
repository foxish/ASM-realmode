;Prints hex

org 7c00h ;all offsets should be calculated from this address
print_hex:
pusha
mov cx, dx              ;store the passed-in parameter in cx
mov di, 5

loopHex:
    mov bx, hex_template ;dx is the start-address parameter to print_string
    add bx, di 
    
    push cx         ; save cx for later shift
    and cx, 0x000f  ; simple bit-mask
    cmp cl, 9       ; checking if it is in the 0-9 or A-F range
    jg alphabet
    add cl, 0x30    ; adding ascii offset for hex digits -> 0-9
    jmp offsetdone
alphabet:
    add cl, 0x37    ; adding ascii offset for hex digits -> A-F
offsetdone:
    mov [bx], cl    ; place it into hex-template at the right offset
    pop cx
    
    shr cx, 4
    dec di
    cmp di, 2
    jge loopHex
    
    mov dx, hex_template
    call print_string
popa
ret

; global variables
hex_template db '0x0000', 0

