.data

str1: .asciiz "Hello World!"

.globl main
.text

main:
      la $a0, str1
      li $v0, 4
      syscall
        