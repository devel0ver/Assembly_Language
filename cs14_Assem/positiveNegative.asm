.data
prompt:		.asciiz "Please enter a number: "
result1: 	.asciiz "Positive"
result2:	.asciiz "Negative"
result3: 	.asciiz "Zero"

.text
	li	$v0, 4
	la	$a0, prompt
	syscall 
	
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	bgtz	$t0, positive
	# else if t0 < 0
	bltz	$t0, negative
	# else if t0 = 0
	li	$v0, 4
	la	$a0, result3
	syscall
	
	b	exit
	
positive:
	li	$v0, 4
	la	$a0, result1
	syscall
	b	exit
	
negative:
	li	$v0, 4
	la	$a0, result2
	syscall
	
exit: