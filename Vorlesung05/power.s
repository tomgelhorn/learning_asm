.data   
str1:   .asciiz "x^k\nx:"
str2:   .asciiz "k:"
str3:   .asciiz "Das Ergebnis ist: "
.text   
    #Print String 1
    la      $a0,    str1
    li      $v0,    4
    syscall 
    #Read int N
    li      $v0,    5
    syscall 
    move    $a1,    $v0

    #Print String 2
    la      $a0,    str2
    li      $v0,    4
    syscall 

    #Read int k
    li      $v0,    5
    syscall 
    move    $a2,    $v0
    jal     calc

end:    

    #Print String 3

    la      $a0,    str3
    li      $v0,    4
    syscall 

    move    $a0,    $a3
    li      $v0,    1
    syscall 
    #EXIT
    li      $v0,    10
    syscall 

calc:   
    # Set count variable to 0
    li      $t0,    0
    li      $a3,    1                   #Set start value
loop:   
    bge     $t0,    $a2,    end

    mul     $a3,    $a3,    $a1
    addi    $t0,    $t0,    1
    j       loop

