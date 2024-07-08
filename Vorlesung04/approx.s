    # C - Code
    #int x = input;
    #x = 1 - x/fac1 + x*x/fac2 - x*x*x/fac3;
    #printf(%d, x);

.data   
fac1:   .word   1
fac2:   .word   2
fac3:   .word   6

.text   
    # $t0 = x
    # $t1 = x^2
    # $t2 = x^3
    # $t7 = mfhi test

    #Input X
    li      $v0,    5
    syscall 
    move    $t0,    $v0

    # Calc power

    mult    $t0,    $t0
    mflo    $t1
    mfhi    $t7
    bne     $t7,    $zero,  excep

    mult    $t1,    $t0
    mflo    $t2
    mfhi    $t7
    bne     $t7,    $zero,  excep

    #Load all ops in registers
    lw      $s0,    fac1
    lw      $s1,    fac2
    lw      $s2,    fac3

    #Divisions

    div     $t0,    $s0
    mflo    $s0
    div     $t1,    $s1
    mflo    $s1
    div     $t2,    $s2
    mflo    $s2

    # Endcalc
    li      $t1,    1
    sub     $t0,    $t1,    $s0
    add     $t0,    $t0,    $s1
    sub     $t0,    $t0,    $s2




    #Output Calc
    move    $a0,    $t0
    li      $v0,    1
    syscall 

excep:  

    #EXIT
    li      $v0,    10
    syscall 