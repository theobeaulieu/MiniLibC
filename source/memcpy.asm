global memcpy

memcpy:
    xor     rcx, rcx

.loop:
    cmp     rcx, rdx
    je      .finish
    mov     r10b, BYTE [rsi + rcx]
    mov     BYTE [rdi + rcx], r10b
    inc     rcx
    jmp     .loop

.finish:
    mov     rax, rdi
    ret