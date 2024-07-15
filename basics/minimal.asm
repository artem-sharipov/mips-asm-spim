# file: minimal.asm - A simple program that does nothing.
# author: Artem Sharipov
# registers used:
#       $v0 - used to pass syscall code.

.text
# main code block (required for SPIM)
main:
# exit code block
exit:
    li $v0, 10  # load 10 for "exit" syscall
    syscall
