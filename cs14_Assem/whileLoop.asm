#1. Use loop to find the sum of all integers from 1 to user input (>0)
# Use loop to find the sum of all integers from 1 to user i
.data
prompt:		.asciiz "Please enter a positive integer: "
result:		.asciiz "The sum is "
error:		.asciiz "Invalid input \nPlease enter a POSITIVE number!"

.text
	li 	$v0, 4
	la 	$a0, prompt
	syscall
	li	$v0, 5
	syscall
	move 	$t0, $v0	#t0 = input num
# Input validation 
while:
	bgtz	$t0, endwhile	
	li 	$v0, 4
	la	$a0, error
	syscall
	
	li 	$v0, 5
	syscall
	move	$t0, $v0
	b 	while
	
endwhile:
	
	li 	$t1, 0		# t1 = i (loop counter)
	addi 	$s0, $zero, 0	# s0 = sum
	
loop:
	bgt	$t1, $t0, endLoop
	add	$s0, $s0, $t1
	addi	$t1, $t1, 1
	b	loop
	
# while loop
endLoop:
	li	$v0, 4
	la	$a0, result
	syscall 
	li	$v0, 1
	move	$a0, $s0
	syscall