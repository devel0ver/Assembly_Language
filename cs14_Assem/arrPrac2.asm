# find the sum of the array and output it
.data
values:	.word 10, 3, 7, 12, 8
sum:	.asciiz	"The sum is "

.text
	li	$s0, 0		# s0 = sum
	li	$t0, 5		# t0 = size = 5
	la	$t1, values	# t1 is the address of 1st element
	
loop:
	lw	$t2, ($t1)	# t2 = element, load/read from memory/array
	add	$s0, $s0, $t2	# sum = sum + values[i]
	addi	$t1, $t1, 4	# increase address, i++
	addi	$t0, $t0, -1
	bgtz	$t0, loop	# t0 > 0 go back to the loop
	# else (t0 = 0) get out of the loop
	
	li 	$v0, 4
	la	$a0, sum
	syscall
	
	li	$v0, 1
	move	$a0, $s0
	syscall
	