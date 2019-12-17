global strstr

strstr:
        xor     rcx, rcx
        mov     rax, rdi

.loop:
        mov     dl, byte [rsi + rcx]
        cmp     byte [rax], 0
        jz      .finish_null
        cmp     byte [rax], dl
        je      .check
        inc     rax
        jmp    .loop

.check:
        mov     dl, byte [rsi + rcx]
        cmp     byte [rsi + rcx], 0
        jz      .finish
        cmp     byte [rax + rcx], dl
        jne     .check_after
        inc     rcx
        jmp     .check

.check_after:
        xor     rcx, rcx
        inc     rax
        jmp     .loop

.finish_null:
        mov     rax, 0
        ret

.finish:
        ret