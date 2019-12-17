global strcasecmp

strcasecmp:
        xor     rcx, rcx

.loop:
        mov     al, byte [rsi]
        cmp     al, 'z'
        jb      .up_one
        cmp      byte [rdi], 'z'
        jb      .up_two
        jmp     .next

.up_one:
        add     al, 32
        jmp     .next

.up_two:
        add     byte [rdi], 32
        jmp     .next

.next:
        cmp     byte [rdi], al
        jne     .check
        cmp     byte [rdi], 0
        jz      .finish
        inc     rdi
        inc     rsi
        jmp     .loop

.check:
        cmp     byte [rdi], 0
        jz      .finish_one
        cmp     byte [rsi], 0
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