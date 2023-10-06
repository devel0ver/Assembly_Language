.data
prompt1: 	.asciiz "Please enter the first integer: "
prompt2:	.asciiz "Please enter the second integer: "
sumResult:	.asciiz "The sum of those two numbers is "
newLine:	.asciiz "\n"
subtraction:	.asciiz " - "
addition: 	.asciiz " + "
equal:		.asciiz " = "
multiplication:	.asciiz " * "
division:	.asciiz " / "
modules:	.asciiz " % "
.text
	li	$v0,  4
	la	$a0, prompt1
	syscall
	li	$v0, 5
	syscall			#v0 = num1
	move	$t0, $v0	#t0 = num1
	
	li	$v0, 4
	la	$a0, prompt2
	syscall
	li	$v0, 5
	syscall			#v0 = num2
	move	$t1, $v0	#t1 = num2
	
	#t0 = num1
	#t1 = num2
	
	#-----------------------------
	# 1. the sum of those two numbers 
	add	$s0, $t1, $t0
	
	li	$v0, 4
	la	$a0, sumResult
	syscall 
	li	$v0, 1
	move	$a0, $s0
	syscall
	
	# New line
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#-----------------------------
	# 2. num1 – num2 + 2
	sub	$s1, $t0, $t1
	addi	$s1, $s1, 2
	
	li	$v0, 1
	move 	$a0, $t0
	syscall			# t0
	li	$v0, 4
	la	$a0, subtraction
	syscall			# t0 -
	li	$v0, 1
	move 	$a0, $t1
	syscall			# t0 - t1
	li	$v0, 4
	la	$a0, addition
	syscall			# t0 - t1 + 
	li	$v0, 1
	la 	$a0, 2
	syscall			# t0 - t1 + 2
	li	$v0, 4
	la	$a0, equal
	syscall			# t0 - t1 + 2 = 
	li	$v0, 1	
	move	$a0, $s1
	syscall			# t0 - t1 + 2 = s1(result)
	#-----------------------------
	
	# New line
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#-----------------------------
	# 3. num1 * num2 - 5]
	mult	$t0, $t1
	mflo	$s2
	addi 	$s2, $s2, -5
	
	li	$v0, 1
	move	$a0, $t0
	syscall			# t0
	li	$v0, 4
	la	$a0, multiplication
	syscall			# t0 * 
	li	$v0, 1
	move	$a0, $t1
	syscall			# t0 * t1
	li	$v0, 4
	la	$a0, subtraction
	syscall			# t0 * t1 -
	li	$v0, 1
	la	$a0, 5
	syscall			# t0 * t1 - 5
	li	$v0, 4
	la	$a0, equal
	syscall			# t0 * t1 - 5 =
	li	$v0, 1
	move 	$a0, $s2
	syscall			# t0 * t1 - 5 = s2(result)
	#-----------------------------
	
	# New line
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#-----------------------------
	# 4. integer results of num1 / num2
	div	$t0, $t1
	mflo	$s3
	
	li	$v0, 1
	move	$a0, $t0
	syscall			# t0
	li	$v0, 4
	la	$a0, division
	syscall			# t0 / 
	li	$v0, 1
	move	$a0, $t1
	syscall			# t0 / t1
	li	$v0, 4
	la	$a0, equal
	syscall			# t0 / t1 = 
	li	$v0, 1
	move	$a0, $s3
	syscall			# t0 / t1 = s3(result)
	#-----------------------------
	
	# New line
	li	$v0, 4
	la	$a0, newLine
	syscall
	
	#-----------------------------
	# 5. num1 % num2 (remainder of num1/num2)
	mfhi	$s3
	
	li	$v0, 1
	move	$a0, $t0
	syscall			# t0
	li	$v0, 4
	la	$a0, modules
	syscall			# t0 % 
	li	$v0, 1
	move	$a0, $t1
	syscall			# t0 % t1
	li	$v0, 4
	la	$a0, equal
	syscall			# t0 % t1 = 
	li	$v0, 1
	move	$a0, $s3
	syscall			# t0 % t1 = s3(result)