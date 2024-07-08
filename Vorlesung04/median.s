.data   
            .align  2
a:          .word   5, 2, 1, 1, 2, 2, 4, 3, 9, 1
str1:       .asciiz "Erster Mittelwert > 5 ist "
str2:       .asciiz " an Position "
newline:    .asciiz ".\n"

.text   

    # $t0 = i zählvariable
    # $t1 = temp value
    # $t2 = memory 1
    # $t3 = memory 2
    # $s0 = 9
    # $s2 = 2
    # $s5 = 5
    # $s4 = 4
    # $t6 = array address
    # $t7 = array address +1

    li      $t0,    0
    li      $t1,    0
    li      $s0,    9
    li      $s2,    2
    li      $s5,    5
    li      $s4,    4
    li      $t6,    0
    li      $t7,    4



loop:       
    bgt     $t1,    $s5,        endLoop
    bge     $t0,    $s0,        endLoop


    # Calc tmp
    lw      $t2,    a($t6)
    lw      $t3,    a($t7)
    add     $t1,    $t2,        $t3
    div     $t1,    $s2
    mflo    $t1



    #Increment i
    addi    $t0,    $t0,        1

    #Calc a adress
    mult    $t0,    $s4
    mflo    $t6
    add     $t7,    $t6,        $s4

    j       loop


endLoop:    
    la      $a0,    str1
    li      $v0,    4
    syscall 

    move    $a0,    $t1
    li      $v0,    1
    syscall 

    la      $a0,    str2
    li      $v0,    4
    syscall 

    move    $a0,    $t0
    li      $v0,    1
    syscall 

    la      $a0,    newline
    li      $v0,    4
    syscall 



    #EXIT
    li      $v0,    10
    syscall 