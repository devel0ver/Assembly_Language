.data
x:	.word 16
y:	.word 30
newline:	.asciiz "\n"

.text
	lw 	$t1, x
	lwl	$t2, y
	
	bgt 	$t1, $t2, if
#else:
	addi	$t1, $t2, -1
	sw	$t1, x
	b 	end
if:
	addi	$t2, $t2, 1
	
end:
	li	$v0, 1
	move	$a0, $t1
	syscall
	
	li	$v0, 4
	la	$a0, newline
	syscall
	
	li	$v0, 1
	move	$a0, $t2
	syscall
