.LC0:
        .string "A is non-zero"
main:
        push    rax
        mov     edi, OFFSET FLAT:.LC0
        xor     eax, eax
        call    printf
        xor     eax, eax
        pop     rdx
        ret