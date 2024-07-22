# file: string.asm
# author: Artem Sharipov

.text
# func: strlen
# arg:
#       $a0 - address of null-terminated byte string.
# ret:
#       $v0 - length of the null-terminated byte string.
strlen:
    move $t0, $a0               # $t0 = $a0

    strlen_loop:
        lb $t1, ($t0)           # $t1 = *($t0)
        beqz $t1, strlen_end    # if ($t1 == 0) goto strlen_end
        addu $t0, $t0, 1        # $t0 += 1
        b strlen_loop           # goto strlen_while

    strlen_end:
        subu $v0, $t0, $a0      # $v0 = $v0 - $a0
        jr $ra                  # return $v0
# endfunc: strlen

# func: strcmp
# arg:
#       $a0 - address of null-terminated byte string;
#       $a1 - address of null-terminated byte string2.
# ret:
#       $v0 - if (string1 > string2) $v0 = 1
#             else if (string1 < string2) $v0 = -1
#             else $v0 = 0
strcmp:
    move $v0, $0                # $v0 = 0

    strcmp_loop:
        lb $t0, ($a0)           # $t0 = *($a0)
        lb $t1, ($a1)           # $t1 = *($a1)
        bne $t0, $t1, strcmp_ne # if ($t0 != $t1) goto strcmp_ne
        beqz $t0, strcmp_end    # if ($t0 == 0) goto strcmp_end
        addu $a0, $a0, 1        # $a0 += 1 
        addu $a1, $a1, 1        # $a1 += 1
        b strcmp_loop           # goto strcmp_while

    strcmp_ne:
        bgt $t0, $t1, strcmp_gt # if ($t0 > $t1) goto strcmp_gt

        li $v0, -1              # $v0 = -1
        b strcmp_end            # goto strcmp_end

    strcmp_gt:
        li $v0, 1               # $v0 = 1

    strcmp_end:
        jr $ra                  # return $v0
# endfunc: strcmp

# func: strncmp
# arg:
#       $a0 - address of null-terminated byte string1;
#       $a1 - address of null-terminated byte string2;
#       $a2 - maximum number of characters to compare.
# ret:
#       $v0 - if (string1 > string2) $v0 = 1
#             else if (string1 < string2) $v0 = -1
#             else $v0 = 0
strncmp:
    move $v0, $0                    # $v0 = 0

    strncmp_while:
        beqz $a2, strncmp_end       # if ($a2 == 0) goto strncmp_end
        lb $t0, ($a0)               # $t0 = *($a0)
        lb $t1, ($a1)               # $t1 = *($a1)
        bne $t0, $t1, strncmp_ne    # if ($t0 != $t1) goto strncmp_ne
        beqz $t0, strncmp_end       # if ($t0 == 0) goto strcmp_end
        addu $a0, $a0, 1            # $a0 += 1
        addu $a1, $a1, 1            # $a1 += 1
        sub $a2, 1                  # $a2 -= 1
        b strncmp_while             # goto strncmp_while

    strncmp_ne:
        bgt $t0, $t1, strncmp_gt    # if ($t0 > $t1) goto strncmp_gt

        li $v0, -1                  # $v0 = -1
        b strncmp_end               # goto strncmp_end

    strncmp_gt:
        li $v0, 1                   # $v0 = 1

    strncmp_end:
        jr $ra                      # return $v0
# endfunc: strncmp

# endfile: string.asm
