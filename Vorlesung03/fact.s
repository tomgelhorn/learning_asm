.data   
n:  .word   10                      # factorial of n

.text   

main:
    #lw      $s0,    n               # load the wanted factorial
    li      $t0,    1               # define the for index
    li      $a0,    1               # define start of mult

    # Input Factorial
    li      $v0,    5               # Input syscall
    syscall 
    move    $s0,    $v0             #Move input to Variable

    jal     fact                    # jump and link to factorial
    li      $v0,    1               #syscall to print value
    syscall 

    #END
    li      $v0,    10
    syscall 



fact:

    bgt     $t0,    $s0,    endFor  # end Loop when i > n

    mult    $a0,    $t0             # n = n*i
    mflo    $a0
    addi    $t0,    $t0,    1       # count up index

    j       fact                    # loop back to top



endFor:
    jr      $ra                     # after loop completes, jump back
