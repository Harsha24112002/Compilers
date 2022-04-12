isprime(int):
        addiu   $sp,$sp,-24
        sw      $fp,20($sp)
        move    $fp,$sp
        sw      $4,24($fp)
        li      $2,2                        # 0x2
        sw      $2,8($fp)
        b       $L2
        nop

$L5:
        lw      $3,24($fp)
        lw      $2,8($fp)
        nop
        div     $0,$3,$2
        bne     $2,$0,1f
        nop
        break   7
        mfhi    $2
        bne     $2,$0,$L3
        nop

        move    $2,$0
        b       $L4
        nop

$L3:
        lw      $2,8($fp)
        nop
        addiu   $2,$2,1
        sw      $2,8($fp)
$L2:
        lw      $2,8($fp)
        nop
        mult    $2,$2
        lw      $2,24($fp)
        mflo    $3
        slt     $2,$2,$3
        beq     $2,$0,$L5
        nop

        li      $2,1                        # 0x1
$L4:
        move    $sp,$fp
        lw      $fp,20($sp)
        addiu   $sp,$sp,24
        jr      $31
        nop

$LC0:
        .ascii  "a is prime\000"
$LC1:
        .ascii  "a is not a prime\000"
main:
        addiu   $sp,$sp,-40
        sw      $31,36($sp)
        sw      $fp,32($sp)
        move    $fp,$sp
        li      $2,25                 # 0x19
        sw      $2,24($fp)
        li      $2,17                 # 0x11
        sw      $2,28($fp)
        lw      $4,24($fp)
        jal     isprime(int)
        nop

        sltu    $2,$0,$2
        andi    $2,$2,0x00ff
        beq     $2,$0,$L7
        nop

        lui     $2,%hi($LC0)
        addiu   $4,$2,%lo($LC0)
        jal     printf
        nop

        b       $L8
        nop

$L7:
        lui     $2,%hi($LC1)
        addiu   $4,$2,%lo($LC1)
        jal     printf
        nop

$L8:
        move    $2,$0
        move    $sp,$fp
        lw      $31,36($sp)
        lw      $fp,32($sp)
        addiu   $sp,$sp,40
        jr      $31
        nop