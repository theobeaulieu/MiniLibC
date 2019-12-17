global strpbrk

strpbrk:
        xor     rcx, rcx
        mov     rax, rdi

.loop:
        cmp     byte [rax], 0
        jz      .false
        jmp     .next

.next:
        mov     dl, byte [rsi + rcx]
        cmp     dl, 0
        jz      .before_loop
        cmp     byte [rax], dl
        je      .finish
        inc     rcx
        jmp     .next
        
.before_loop:
        inc     rax
        xor     rcx, rcx
        jmp     .loop
.false:
        mov     rax, 0
        ret

.finish:
        ret