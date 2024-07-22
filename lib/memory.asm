# file: memory.asm
# author: Artem Sharipov

.text
# func: memset
# desc: Copies the value (character) into each of the
#       first count characters of the object pointed to by dest.
# arg:
#       $a0 - address to the object to fill:
#       $a1 - fill byte;
#       $a2 - number of bytes to fill.
# ret:
#       $v0 - address to the object to fill.
memset:
    move $v0, $a0               # $v0 = $a0

    memset_loop:
        beqz $a2, memset_end    # if ($a2 == 0) goto memset_end
        sb $a1, ($a0)           # *($a0) = $a1
        add $a0, 1              # $a0 += 1
        sub $a2, 1              # $a2 -= 1

    memset_end:
        jr $ra                  # return $v0
# endfunc: memset

# endfile: memory.asm
