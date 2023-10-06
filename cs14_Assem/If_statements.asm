#if(num<0) cout<<“Negative”<<endl;
#q	else cout<<“Non-negative”<<endl;
.data
prompt: 	.asciiz "Please enter a num: "
result1: 	.asciiz "Negative\n"
result2:	.asciiz "Non-negative\n"

.text

	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	move	$t1, $v0
	
	bltz	$t1, if
	#else block
	li	$v0, 4
	la 	$a0, result2
	syscall
	#li	$v0, 10
	#syscall
	b 	exit
	
	 
if: 
	li	$v0, 4
	la 	$a0, result1
	syscall
	
	
	
exit: 
	li	$v0, 10
	syscall
