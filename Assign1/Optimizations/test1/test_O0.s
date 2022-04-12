.LC0:
        .string "A is zero"
.LC1:
        .string "A is non-zero"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], 0
        mov     DWORD PTR [rbp-8], 0
        mov     DWORD PTR [rbp-4], 0
        jmp     .L2
.L3:
        mov     DWORD PTR [rbp-8], 33
        mov     eax, DWORD PTR [rbp-8]
        add     DWORD PTR [rbp-12], eax
        add     DWORD PTR [rbp-4], 1
.L2:
        cmp     DWORD PTR [rbp-4], 24
        jle     .L3
        cmp     DWORD PTR [rbp-8], 0
        jne     .L4
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
        jmp     .L5
.L4:
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    printf
.L5:
        mov     eax, 0
        leave
        ret