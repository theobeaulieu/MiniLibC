global rindex

rindex:
        mov     rax, rdi

.loop:
        cmp     byte [rax], 0
        jz      .decr_before
        inc     rax
        jmp     .loop

.decr_before:
        dec     rax
        jmp     .decr

.decr:
        cmp     byte [rax], sil
        je      .finish
        cmp     byte [rax], 0
        je      .false
        dec     rax
        jmp     .decr

.false:
        mov     rax, 0
        ret

.finish:
        ret