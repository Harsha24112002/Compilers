.LC0:
        .string "A is non-zero"
main:
        sub     rsp, 8
        mov     eax, 25
.L2:
        sub     eax, 1
        jne     .L2
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
        mov     eax, 0
        add     rsp, 8
        ret