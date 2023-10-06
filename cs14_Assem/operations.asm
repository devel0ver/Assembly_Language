.data
prompt1:		.asciiz "Please enter the 1st number: "
prompt2:		.asciiz "Please enter the 2nd number: "
result1:		.asciiz "the sum is "
result2:		.asciiz "\nThe difference is "
newLine:		.asciiz "\n"
.text	
		li	$v0, 4
		la	$a0, prompt1
		syscall
		
		li	$v0, 5
		syscall			#v0 = num1
		move	$t1, $v0	#t1 = num1
		
		li	$v0, 4
		la	$a0, prompt2
		syscall
		
		li	$v0, 5
		syscall			#v0 = num2
		move	$t2, $v0	#t1 = num2
		
		add	$s1, $t1, $t2	#s1 = t1 + t2
		sub	$s2, $t1, $t2	#s2 = t1 - t2
		
		li	$v0, 4
		la	$a0, result1
		syscall
		li	$v0, 1
		move	$a0, $s1
		syscall
		
		li	$v0, 4
		la	$a0, result2
		syscall
		li	$v0, 1
		move	$a0, $s2
		syscall
		
		mult	$t1, $t2
		mflo	$s3		#s3 = num1 * num2
		addi	$s3, $s3, -10	#s3 = s3 - 10
		
		li	$v0, 4
		la	$a0, newLine
		syscall
		
		li 	$v0, 1
		add	$a0, $s3, $zero
		syscall 
		
		
		li	$t3, 3
		mult	$t3, $t1
		mflo	$s4		#s4 = 3 * num1
		add	$s5, $s4, $t2
		
		li	$v0, 4
		la	$a0, newLine
		syscall
		
		move	$a0, $s5
		
		li	$v0, 1
		syscall
		
		li	$v0, 4
		la	$a0, newLine	#create a new line
		syscall
		
		li	$t5, 2
		div	$t1, $t5
		mflo	$s6
		add	$a0, $s6, $t2
		li	$v0, 1
		syscall
		
		li	$v0, 4
		la	$a0, newLine	#create a new line
		syscall
		
		div	$t1, $t2
		mfhi	$s7		#s7 = t1 % t2
		li	$v0, 1
		move	$a0, $s7
		syscall
		
