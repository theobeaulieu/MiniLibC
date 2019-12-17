global memset

memset:
    mov     rax, rdi
    xor     rcx, rcx

.loop:
    cmp     rcx, rdx
    jz      .finish
    mov     [rax], sil
    inc     rcx
    inc     rax
    jmp     .loop

.finish:
    mov     rax, rdi
    ret