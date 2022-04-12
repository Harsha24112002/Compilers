isprime(int):
        mov     ecx, 2
.L2:
        mov     eax, ecx
        imul    eax, ecx
        cmp     eax, edi
        jg      .L9
        mov     eax, edi
        cdq
        idiv    ecx
        mov     eax, edx
        test    edx, edx
        je      .L1
        inc     ecx
        jmp     .L2
.L9:
        mov     eax, 1
.L1:
        ret
.LC0:
        .string "a is prime"
.LC1:
        .string "a is not a prime"
main:
        push    rcx
        mov     edi, 25
        call    isprime(int)
        mov     edi, OFFSET FLAT:.LC0
        test    eax, eax
        jne     .L14
        mov     edi, OFFSET FLAT:.LC1
.L14:
        xor     eax, eax
        call    printf
        xor     eax, eax
        pop     rdx
        ret