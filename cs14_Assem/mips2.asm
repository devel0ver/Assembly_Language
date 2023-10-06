.data
age:		.asciiz "Please enter your age: "
prompt:		.asciiz "Please enter your name: "
num1Prompt:	.asciiz "Please enter the first number: "
num2Prompt:	.asciiz "Please enter the second number: "	
name: 		.space 21
result: 	.asciiz "Your name is: "
result1:	.asciiz "Your age is: "
result_diff:	.asciiz "\nThe difference is: "

.text
main:
	
	li 	$v0, 4
	la 	$a0, prompt
	syscall
	
	addi 	$v0, $zero, 8		#v0 = 8
	la	$a0, name
	li	$a1, 20
	syscall
	
	li 	$v0, 4
	la	$a0, age
	syscall
	
	li	$v0, 5
	syscall			# input ia in $v0
	move	$s1, $v0	# store input into $s1
	
	#Display num1 prompt
	li	$v0, 4
	la 	$a0, num1Prompt
	syscall
	
	#get input
	addi	$v0, $zero, 5
	syscall			# v0 = input data (num1)
	move 	$t1, $v0	# t1 = v0 = num1
	
	#Display num2 prompt
	li	$v0, 4
	la 	$a0, num2Prompt
	syscall
	
	#get input
	addi	$v0, $zero, 5
	syscall			# v0 = input data (num2)
	move 	$t2, $v0	# t2 = v0 = num2
	
	# addding and subtracting inputs
	add	$t3, $t1, $t2	#t3 = num1 + num2 = sum
	sub 	$t4, $t1, $t2	#t4 = difference = num1 - num2
	
	
	# Displaying To USER the results
	li 	$v0, 4
	la 	$a0, result
	syscall
	li	$v0, 4
	la 	$a0, name
	syscall
	
	li	$v0, 4
	la	$a0, result1
	syscall
	
	li	$v0, 1
	move	$a0, $s1
	syscall
	
	li	$v0, 4
	la	$a0, result_diff
	syscall
	
	li	$v0, 1
	add	$a0, $t4, $zero
	syscall			# output the difference
	
	li	$v0, 10
	syscall
	
	