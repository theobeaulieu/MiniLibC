global strcspn

strcspn:
        xor     rcx, rcx
        xor     rdx, rdx
        mov     rax, rdx

.loop:
        cmp     byte [rdi + rax], 0
        jz      .finish
        jmp     .next

.next:
        mov     dl, byte [rsi + rcx]
        cmp     dl, 0
        jz      .before_loop
        cmp     byte [rdi + rax], dl
        je      .finish
        inc     rcx
        jmp     .next

.before_loop:
        inc     rax
        xor     rcx, rcx
        jmp     .loop

.finish:
        ret