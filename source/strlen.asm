global strlen

strlen:
        xor     rcx, rcx
        mov     rax, rcx

.loop:
        cmp     BYTE [rdi + rax], 0
        jz      .exit
        inc     rax
        jmp     .loop

.exit:
        ret