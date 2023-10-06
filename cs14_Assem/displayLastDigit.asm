#ask user to input a number
#and then display the last digit of that number
.data
prompt:		.asciiz "Please enter a number: "
result: 	.asciiz "The last digit is "
result2: 	.asciiz "\nThe qoutient is "

# In the c++ code : 
# 123 --> 3
# 1052 --> 2
# int num;
# cout << "Enter bumber: "
# cin >> num;
# int digit = num % 10;
# cout << "last digit is " << digit;
.text
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall		#input is in $v0
	
	li $t1, 10
	div $v0, $t1
	mfhi $t2	#last digit is in $t2
	mflo $t3
	
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, result2
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 10
	syscall