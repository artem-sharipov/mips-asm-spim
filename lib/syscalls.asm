# file: syscalls.asm
# author: Artem Sharipov

.text
# func: syscall_print_int
# arg:
#       $a0 - integer for print.
# ret:
#       None.
syscall_print_int:
    li $v0, 1
    syscall
    jr $ra
# endfunc: syscall_print_int

# func: syscall_print_float
# arg:
#       $f12 - float for print.
# ret:
#       None.
syscall_print_float:
    li $v0, 2
    syscall
    jr $ra
# endfunc: syscall_print_float

# func: syscall_print_double
# arg:
#       $f12 - double for print.
# ret:
#       None.
syscall_print_double:
    li $v0, 3
    syscall
    jr $ra
# endfunc: syscall_print_double

# func: syscall_print_string
# arg:
#       $a0 - address of string for print.
# ret:
#       None.
syscall_print_string:
    li $v0, 4
    syscall
    jr $ra
# endfunc: syscall_print_string

# func: syscall_read_int
# arg:
#       None.
# ret:
#       $v0 - read integer.
syscall_read_int:
    li $v0, 5
    syscall
    jr $ra
# endfunc: syscall_read_int

# func: syscall_read_float
# arg:
#       None.
# ret:
#       $f0 - read float.
syscall_read_float:
    li $v0, 6
    syscall
    jr $ra
# endfunc: syscall_read_float

# func: syscall_read_double
# arg:
#       None.
# ret:
#       $f0 - read double.
syscall_read_double:
    li $v0, 7
    syscall
    jr $ra
# endfunc: syscall_read_double

# func: syscall_read_string
# arg:
#       $a0 - address of string.
#       $a1 - length of string.
# ret:
#       None.
syscall_read_string:
    li $v0, 8
    syscall
    jr $ra
# endfunc: syscall_read_string

# func: syscall_sbrk
# arg:
#       $a0 - number of bytes.
# ret:
#       $v0 - address of bytes.
syscall_sbrk:
    li $v0, 9
    syscall
    jr $ra
# endfunc: syscall_sbrk

# func: syscall_exit
# arg:
#       None.
# ret:
#       None.
syscall_exit:
    li $v0, 10
    syscall
    jr $ra
# endfunc: syscall_exit

# endfile: syscalls.asm