.data
prompt:		.asciiz "Please enter a number: "
result:		.asciiz "The counter is "
result2:	.asciiz "\nThe sum is "

.text
	li	$t0, -99
	li	$s0, 0
loop:
	
	li	$v0, 4
	la	$a0, prompt
	syscall
	li	$v0, 5
	syscall
	move	$t1, $v0
	
	beq	$t1, $t0, endloop
	
	li	$t2, 2
	div	$t1, $t2
	mfhi	$t3
	
	li	$t4, 1
	beq	$t3, $t4, oddSum
	
	b	loop

oddSum:
	add	$s1, $s1, $t1
	addi 	$s0, $s0, 1
	b 	loop

endloop:
	li	$v0, 4
	la	$a0, result
	syscall
	li	$v0, 1
	move	$a0, $s0
	syscall
	
	li	$v0, 4
	la	$a0, result2
	syscall
	li	$v0, 1
	move	$a0, $s1
	syscall