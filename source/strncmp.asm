global strncmp

strncmp:
        xor     rcx, rcx
.loop:
        cmp     rdx, 0
        je      .finish
        mov     al, byte [rsi + rcx]
        cmp     byte [rdi + rcx], al
        jne     .check
        cmp     byte [rdi + rcx], 0
        jz      .finish
        inc     rcx
        dec     rdx
        jmp     .loop

.check:
        cmp     byte [rdi + rcx], 0
        jz      .finish_one
        cmp     byte [rsi + rcx], 0
        jz      .finish_two

.finish_one:
        mov     rax, -1
        ret
    
.finish_two:
        mov     rax, 1
        ret

.finish:
        mov     rax, 0
        ret