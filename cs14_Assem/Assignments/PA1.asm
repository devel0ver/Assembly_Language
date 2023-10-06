.data
prompt1:	.asciiz "Please enter the first integer: "
prompt2:	.asciiz "Please enter the second integer: "
sumResult:	.asciiz "\nThe sum of those two number is "
result2:	.asciiz "\nnum1 - num2 + 2 = "
result3:	.asciiz "\nnum1 * num2 - 5 = "
divResult:	.asciiz "\nnum1 / num2 = "
remResult:	.asciiz "\nnum1 % num2 = "

.text
	li $v0, 4
	la $a0, prompt1
	syscall
	li $v0, 5
	syscall		#v0 = num1
	move $t1, $v0	#t1 = num1
	
	li $v0, 4
	la $a0, prompt2
	syscall
	li $v0, 5
	syscall		#v0 = num2
	move $t2, $v0	#t2 = num2
	
	#t1 = num1
	#t2 = num2
	
	#-----------------------------
	# 1. the sum of those two numbers 
	add $s1, $t1, $t2		#s1 = t1 + t2
	
	li $v0, 4
	la $a0, sumResult
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	
		
	#-----------------------------
	# 2. num1 – num2 + 2
	sub $s2, $t1, $t2
	addi $s2, $s2, 2
	
	li $v0, 4
	la $a0, result2
	syscall
	li $v0, 1
	move $a0, $s2
	syscall
	
	#-----------------------------
	# 3. num1 * num2 - 5
	mult $t1, $t2
	mflo $s3
	addi $s3, $s3, -5
	
	li $v0, 4
	la $a0, result3
	syscall
	li $v0, 1
	move $a0, $s3
	syscall
	
	#-----------------------------
	# 4. integer results of num1 / num2
	div $t1, $t2
	mflo $s4
	
	li $v0, 4
	la $a0, divResult
	syscall
	li $v0, 1
	move $a0, $s4
	syscall
	
	#-----------------------------
	# 5. num1 % num2 (remainder of num1/num2)
	mfhi $s4
	
	li $v0, 4
	la $a0, remResult
	syscall
	li $v0, 1
	move $a0, $s4
	syscall
	
	
	
