# file: hello.asm - A simple program that prints the string "Hello, world!".
# author: Artem Sharipov
# registers used:
#       $a0 - used to pass syscall argument;
#       $v0 - used to pass syscall code.

.text
# main code block (required for SPIM)
main:
# print "Hello, world!" code block
print_message:
    la $a0, message     # load address of message string
    li $v0, 4           # load 4 for "print_string" syscall
    syscall

# exit code block
exit:
    li $v0, 10          # load 10 for "exit" syscall
    syscall

.data
message: .asciiz "Hello, world!\n"
