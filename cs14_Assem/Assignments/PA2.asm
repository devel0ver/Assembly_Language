.data
message:	.asciiz "Please enter year: "
result:		.asciiz "A leap year"
result2: 	.asciiz "Not a leap year"

.text
	li	$v0, 4
	la	$a0, message
	syscall 
	
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	li	$s0, 400
	div 	$t0, $s0
	mfhi	$t1
	beqz	$t1, leap
	
	li	$s1, 100
	div 	$t0, $s1
	mfhi	$t2
	beqz	$t2, notLeap
	
	#li	$s2, 4
	#div 	$t0, $s2
	#mfhi	$t3
	andi	$t3, $t0, 3
	beqz	$t3, leap
	
	li	$v0, 4
	la	$a0, result2
	syscall
	
	b	end
	
  leap:
  	li	$v0, 4
  	la	$a0, result
  	syscall
	b	end

  notLeap:
  	li	$v0, 4
  	la	$a0, result2
  	syscall

  end:

#get input t0 = year

# t1 = t0 % 400
# t2 = t0 % 100
# t3 = t0 % 4