global strcmp

strcmp:
        xor     rcx, rcx
.loop:
        mov     al, byte [rsi + rcx]
        cmp     byte [rdi + rcx], al
        jne     .check
        cmp     byte [rdi + rcx], 0
        jz      .finish
        inc     rcx
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