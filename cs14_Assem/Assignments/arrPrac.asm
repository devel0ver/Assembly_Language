.data 

values: 	.space 16

.text
	la	$s0, values	#$s0 is holding the addess of values
	li	$t0, 0
	#sw	$t0, values
	li	$t1, 4
	
loop:
	sw 	$t0, ($s0)
	
	addi	$t0, $t0, 1
	#sw	$t0, values+4
	addi	$s0, $s0, 4
	addi	$t1, $t1, -1
	bgtz	$t1, loop