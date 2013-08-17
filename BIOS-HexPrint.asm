mov dx, 0x1fb6
call print_hex
hlt

%include "include/print_string.asm"
%include "include/print_hex.asm"
jmp $

times 510 - ($ - $$) db 0
dw 0xaa55


