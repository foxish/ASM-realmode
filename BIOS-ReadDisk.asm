; Read disk in BIOS mode
org 7c00h       ;all offsets should be calculated from this address

; clear stack and set out of the way
mov bp, 0x8000
mov sp, bp

; prepare to read from disk
mov bx, 0x0
mov es, bx ;set the ES

mov bx, 0x9000 ;set offset
mov dh, 5      ;sectors to read
mov dl, 0      ;drive number
call read_disk

; print things read out
mov bx, 0x9000
mov di, 0

loopRead:       ;print out things in a loop
mov dx, [bx+di]
add di, 512
call print_hex

cmp di, 2048
jl loopRead

hlt

%include "include/print_string.asm"
%include "include/print_hex.asm"
%include "include/read_disk.asm"

jmp $ ; infinite loop

times 510 - ($ - $$) db 0
dw 0xaa55

times 256 dw 0xbabe
times 256 dw 0xd1ee
times 256 dw 0xdead
times 256 dw 0xbeef

