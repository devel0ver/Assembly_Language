.data
prompt1:	.asciiz "Enter number for t1: "
prompt2:	.asciiz "Enter number for t2: "
print_t1:	.asciiz "t1 is: "
qoutient:	.asciiz "\nThe qoutient is: "

.text
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	div $t1, $t2
	mflo $s1
	
	li $v0, 4
	la $a0, print_t1
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, qoutient
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	
	
	
	