isprime(int):
        cmp     edi, 3
        jle     .L5
        test    dil, 1
        je      .L6
        mov     ecx, 2
.L3:
        add     ecx, 1
        mov     eax, ecx
        imul    eax, ecx
        cmp     eax, edi
        jg      .L7
        mov     eax, edi
        cdq
        idiv    ecx
        mov     eax, edx
        test    edx, edx
        jne     .L3
.L1:
        ret
.L7:
        mov     eax, 1
        ret
.L5:
        mov     eax, 1
        ret
.L6:
        mov     eax, 0
        jmp     .L1
.LC0:
        .string "a is prime"
.LC1:
        .string "a is not a prime"
main:
        sub     rsp, 8
        mov     edi, 25
        call    isprime(int)
        test    eax, eax
        je      .L9
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
.L10:
        mov     eax, 0
        add     rsp, 8
        ret
.L9:
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    printf
        jmp     .L10