isprime(int):
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-20], edi
        mov     DWORD PTR [rbp-4], 2
        jmp     .L2
.L5:
        mov     eax, DWORD PTR [rbp-20]
        cdq
        idiv    DWORD PTR [rbp-4]
        mov     eax, edx
        test    eax, eax
        jne     .L3
        mov     eax, 0
        jmp     .L4
.L3:
        add     DWORD PTR [rbp-4], 1
.L2:
        mov     eax, DWORD PTR [rbp-4]
        imul    eax, eax
        cmp     DWORD PTR [rbp-20], eax
        jge     .L5
        mov     eax, 1
.L4:
        pop     rbp
        ret
.LC0:
        .string "a is prime"
.LC1:
        .string "a is not a prime"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], 25
        mov     DWORD PTR [rbp-8], 17
        mov     eax, DWORD PTR [rbp-4]
        mov     edi, eax
        call    isprime(int)
        test    al, al
        je      .L7
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
        jmp     .L8
.L7:
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    printf
.L8:
        mov     eax, 0
        leave
        ret