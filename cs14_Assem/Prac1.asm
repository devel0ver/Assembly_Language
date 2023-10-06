.data
num:	.word 2023
result:	.asciiz "\nthe answer is \n"

.text
	#li	$v0, 1
	addi	$v0, $zero, 1
	lw	$a0, num
	syscall
	
	li	$v0, 4
	la	$a0, result
	syscall
	