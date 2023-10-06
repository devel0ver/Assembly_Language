.data 

.text
	li	$s4, 12
	sll	$s4, $s4, 3	# s4 = s4 * 2^3
	
	li 	$v0, 1
	move 	$a0, $s4
	syscall
	