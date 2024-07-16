# file: addition.asm - A simple program that performs addition of two integers.
# author: Artem Sharipov
# registers used:
#       $t0 - used to hold the result (sum);
#       $t1 - used to hold the first integer operand;
#       $t2 - used to hold the second integer operand;
#       $a0 - used to pass syscall argument;
#       $v0 - used to pass syscall code.

.text
# read integer procedure code block
inputInt:
    li $v0, 5                   # load 5 for "read_int" syscall
    syscall

    jr $ra                      # return from procedure

# print integer procedure code block
printInt:
    li $v0, 1                   # load 1 for "print_int" syscall
    syscall

    jr $ra                      # return from procedure

# print string procedure code block
printString:
    li $v0, 4                   # load 4 for "print_string" syscall
    syscall

    jr $ra                      # return from procedure

# print "\n" procedure code block
printNewline:
    la $a0, newline             # load address of newline string
    li $v0, 4                   # load 4 for "print_string" syscall
    syscall

    jr $ra                      # return from procedure

# main code block (required for SPIM)
main:
    la $a0, begin_message       # load address of begin_message string
    jal printString             # call printSring procedure
    jal printNewline            # call printNewline procedure

    la $a0, request_message_1   # load address of request_message_1 string
    jal printString             # call printString procedure

    jal inputInt                # call inputInt procedure
    move $t1, $v0

    la $a0, request_message_2   # load address of request_message_2 string
    jal printString             # call printString procedure

    jal inputInt                # call inputInt procedure
    move $t2, $v0

    add $t0, $t1, $t2           # addition: $t1 + $t2 = $t0

    la $a0, end_message         # load address of end_message string
    jal printString             # call printString procedure

    move $a0, $t0           
    jal printInt                # call printInt procedure

    jal printNewline

# exit code block
exit:
    li $v0, 10                  # load 10 for "exit" syscall
    syscall

.data
begin_message:      .asciiz "The program performs the addition of two entered numbers."
request_message_1:  .asciiz "Enter the term A = "
request_message_2:  .asciiz "Enter the term B = "
end_message:        .asciiz "S = A + B = "
newline:            .asciiz "\n"
