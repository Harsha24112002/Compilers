.LC0:
        .ascii  "%d\012\000"
main:
        push    {r7, lr}
        sub     sp, sp, #8
        add     r7, sp, #0
        movs    r3, #25
        str     r3, [r7, #4]
        movs    r3, #99
        str     r3, [r7]
        ldr     r2, [r7, #4]
        ldr     r3, [r7]
        add     r3, r3, r2
        mov     r1, r3
        movw    r0, #:lower16:.LC0
        movt    r0, #:upper16:.LC0
        bl      printf
        movs    r3, #0
        mov     r0, r3
        adds    r7, r7, #8
        mov     sp, r7
        pop     {r7, pc}