# file: procedure.asm - A simple program showing how to work with the procedure.
# author: Artem Sharipov
# registers used:
#       $a0 - used to pass syscall argument;
#       $v0 - used to pass syscall code.

.text
# print procedure code block
print:
    li $v0, 4           # load 4 for "print_string" syscall
    syscall

    la $a0, newline     # load address of newline string
    li $v0, 4           # load 4 for "print_string" syscall
    syscall

    jr $ra              # return from procedure

# main code block (required for SPIM)
main:
    la $a0, message_1   # load address of message_1 string
    jal print           # call print procedure

    la $a0, message_2   # load address of message_2 string
    jal print           # call print procedure

    la $a0, message_3   # load address of message_3 string
    jal print           # call print procedure

    la $a0, message_4   # load address of message_4 string
    jal print           # call print procedure

    la $a0, message_5   # load address of message_5 string
    jal print           # call print procedure

# exit code block
exit:
    li $v0, 10          # load 10 for "exit" syscall
    syscall

.data
message_1:  .asciiz "Sample message #1"
message_2:  .asciiz "Sample message #2"
message_3:  .asciiz "Sample message #3"
message_4:  .asciiz "Sample message #4"
message_5:  .asciiz "Sample message #5"
newline:    .asciiz "\n"
