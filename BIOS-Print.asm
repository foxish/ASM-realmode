;Generates a basic bootloader, which prints out a message to screen and then jumps around doing nothing ;)

mov ah, 0x0e ;BIOS printing
mov al, 'F'
int 0x10 ;Interrupt x86 real-mode
mov al, 'o'
int 0x10
mov al, 'x'
int 0x10

jmp $ ;idle loop
times 510 -( $ - $$ ) db 0
dw 0xaa55
