.data
message:	.asciiz "The numbers are equal."
message1: 	.asciiz "Nothing happened."
message2:	.asciiz "The numbers are different."


.text
    main: 
	addi 	$t0, $zero, 2
	addi 	$t1, $zero, 20
	
	beq 	$t0, $t1, numbersEqual
	# else 
	li	$v0, 4
	la	$a0, message2
	syscall
	
	addi	$t2, $zero, 5
	addi	$t3, $zero, 5
	
	bne 	$t2, $t3, numbersDifferent
	
	
	# Syscall to end program
	la 	$v0, 10
	syscall	
	
    numbersEqual:
    	li 	$v0, 4
    	la 	$a0, message
    	syscall
    	
    numbersDifferent:
    	li	$v0, 4
    	la	$a0, message2
    	syscall