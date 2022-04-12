$LC0:
        .ascii  "%d\012\000"
main:
        addiu   $sp,$sp,-40
        sw      $31,36($sp)
        sw      $fp,32($sp)
        move    $fp,$sp
        li      $2,25                 # 0x19
        sw      $2,24($fp)
        li      $2,99                 # 0x63
        sw      $2,28($fp)
        lw      $3,24($fp)
        lw      $2,28($fp)
        nop
        addu    $2,$3,$2
        move    $5,$2
        lui     $2,%hi($LC0)
        addiu   $4,$2,%lo($LC0)
        jal     printf
        nop

        move    $2,$0
        move    $sp,$fp
        lw      $31,36($sp)
        lw      $fp,32($sp)
        addiu   $sp,$sp,40
        jr      $31
        nop