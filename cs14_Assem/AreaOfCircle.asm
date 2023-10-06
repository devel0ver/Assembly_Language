.data
prompt: 	.asciiz "Result :"

.text
Area:	
	li	$t0, 314159	# Load immediate Pi scaled up  100,000
	mult	$t8, $t8		# Radius squared
	mflo	$t1		# Move lower 32-bits of product in
				# Low register to $t1
	mult	$t1, $t0		# Multiply by scaled Pi
	mflo	$s0		# Move lower 32-bits of product in
				# Low register to $s0
	li	$t1, 100000	# Load immediate scale factor of 100,000
	div	$s0, $t1	# Divide by scale factor
	mflo	$s0		# Truncated integer result left in $s0
	
	li	$v0, 5
	la	$a0, prompt

	li	$v0, 1
	move	$a0, $s0
	
	li	$v0, 10
	syscall
