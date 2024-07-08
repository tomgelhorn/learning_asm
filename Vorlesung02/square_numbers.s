    # Data declarations
.data   
            .align  2
v:          .space  80                  # Allocate 80 bytes of space for array v
i:          .word   0                   # Initialize i to 0
str1:       .asciiz "precise sum: "     # String for printing "precise sum: "
str2:       .asciiz "/"                 # String for printing "/"
str3:       .asciiz " and remainder: "  # String for printing " and remainder: "
newline:    .asciiz "\n"                # String for printing a new line

            .globl  main
.text   
main:       
    lw      $t0,    i                   # Load the value of i into $t0
    la      $t1,    v                   # Load the address of v into $t1

    li      $t4,    4                   # Load the value 4 into $t4
    li      $t5,    20                  # Load the value 20 into $t5

loop:       
    mult    $t0,    $t0                 # Multiply i by itself
    mflo    $t2                         # Store the result in $t2 (i^2)

    # Calculate the address
    mult    $t0,    $t4                 # Multiply i by 4
    mflo    $t3                         # Store the result in $t3

    sw      $t2,    v($t3)              # Store the value of i^2 in v[i]

    # Print the value of i^2
    move    $a0,    $t2                 # Move the value of $t2 into $a0
    li      $v0,    1                   # Syscall code 1 for printing an integer
    syscall                             # Execute the syscall

    la      $a0,    newline             # Print the new line character to move the screen cursor to a new line
    li      $v0,    4
    syscall 

    # Calculate the sum
    add     $s0,    $s0,        $t2     # Add the value of $t2 to $s0 (sum)

    addi    $t0,    $t0,        1       # Increment i by 1
    bne     $t0,    20,         loop    # Branch to loop if i is not equal to 20

    # End of loop

    divu    $s0,    $t5                 # Divide the value of $s0 (sum) by 20
    mflo    $s0                         # Store the quotient in $s0
    mfhi    $s1                         # Store the remainder in $s1

    la      $a0,    str1                # Load the address of str1 into $a0
    li      $v0,    4                   # Syscall code 4 for printing a string
    syscall                             # Print str1

    move    $a0,    $s0                 # Move the value of $s0 (quotient) into $a0
    li      $v0,    1                   # Syscall code 1 for printing an integer
    syscall 

    la      $a0,    str3                # Load the address of str3 into $a0
    li      $v0,    4                   # Syscall code 4 for printing a string
    syscall 

    move    $a0,    $s1                 # Move the value of $s1 (remainder) into $a0
    li      $v0,    1                   # Syscall code 1 for printing an integer
    syscall 

    la      $a0,    str2                # Load the address of str2 into $a0
    li      $v0,    4                   # Syscall code 4 for printing a string
    syscall                             # Print str2

    move    $a0,    $t5                 # Move the value of $t5 into $a0
    li      $v0,    1                   # Syscall code 1 for printing an integer
    syscall 

    ### Exit
    li      $v0,    10                  # Syscall code 10 for terminating the program
    syscall 
