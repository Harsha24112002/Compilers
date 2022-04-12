isprime(int):
        push    {r7, lr}
        sub     sp, sp, #16
        add     r7, sp, #0
        str     r0, [r7, #4]
        movs    r3, #2
        str     r3, [r7, #12]
        b       .L2
.L5:
        ldr     r3, [r7, #4]
        ldr     r1, [r7, #12]
        mov     r0, r3
        bl      __aeabi_idivmod
        mov     r3, r1
        cmp     r3, #0
        bne     .L3
        movs    r3, #0
        b       .L4
.L3:
        ldr     r3, [r7, #12]
        adds    r3, r3, #1
        str     r3, [r7, #12]
.L2:
        ldr     r3, [r7, #12]
        mul     r3, r3, r3
        ldr     r2, [r7, #4]
        cmp     r2, r3
        bge     .L5
        movs    r3, #1
.L4:
        mov     r0, r3
        adds    r7, r7, #16
        mov     sp, r7
        pop     {r7, pc}
.LC0:
        .ascii  "a is prime\000"
.LC1:
        .ascii  "a is not a prime\000"
main:
        push    {r7, lr}
        sub     sp, sp, #8
        add     r7, sp, #0
        movs    r3, #25
        str     r3, [r7, #4]
        movs    r3, #17
        str     r3, [r7]
        ldr     r0, [r7, #4]
        bl      isprime(int)
        mov     r3, r0
        cmp     r3, #0
        ite     ne
        movne   r3, #1
        moveq   r3, #0
        uxtb    r3, r3
        cmp     r3, #0
        beq     .L7
        movw    r0, #:lower16:.LC0
        movt    r0, #:upper16:.LC0
        bl      printf
        b       .L8
.L7:
        movw    r0, #:lower16:.LC1
        movt    r0, #:upper16:.LC1
        bl      printf
.L8:
        movs    r3, #0
        mov     r0, r3
        adds    r7, r7, #8
        mov     sp, r7
        pop     {r7, pc}