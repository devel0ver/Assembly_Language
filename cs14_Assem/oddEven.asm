# as

.data
prompt:		.asciiz "Please enter an integer"
result1:	.asciiz "Even"
result2:	.asciiz "Odd"

.text
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	move	$t0, $v0	#t0 = input number
	
	li	$t1, 2
	div	$t0, $t1
	mfhi	$t2		#t2 = t0 % 2
	
	beqz	$t2, printEven	# t0 % 2 == 0 branch to printEven
	
	#else
	li	$v0, 4
	la	$a0, result2
	syscall
	b 	end
	
printEven:
	li	$v0, 4
	la	$a0, result1
	syscall
	b 	end

printOdd:
	li	$v0, 4
	la	$a0, result1
	syscall
	
end:
