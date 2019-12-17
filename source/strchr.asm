global strchr

strchr:
        mov     rax, rdi

.loop:
        cmp     byte [rax], sil
        je      .exit
        cmp     byte [rax], 0
        jz      .false
        inc     rax
        jmp     .loop

.false:
        mov rax, 0
        ret

.exit:
        ret