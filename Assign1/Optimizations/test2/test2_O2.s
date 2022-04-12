isprime(int):
        cmp     edi, 3
        jle     .L5
        test    dil, 1
        je      .L6
        mov     ecx, 2
        jmp     .L3
.L4:
        mov     eax, edi
        cdq
        idiv    ecx
        test    edx, edx
        je      .L1
.L3:
        add     ecx, 1
        mov     eax, ecx
        imul    eax, ecx
        cmp     eax, edi
        jle     .L4
.L5:
        mov     edx, 1
.L1:
        mov     eax, edx
        ret
.L6:
        xor     edx, edx
        jmp     .L1
.LC0:
        .string "a is not a prime"
main:
        sub     rsp, 8
        mov     edi, OFFSET FLAT:.LC0
        xor     eax, eax
        call    printf
        xor     eax, eax
        add     rsp, 8
        ret