# cout << t3;	(t3 = 20)
li 	$v0, 1
move 	$a0, $t3
#add 	$a0, $t3, $zero
#addi	$a0, $t3, 0
syscall

# cin >> t0;   		(input integer)
li	$v0, 5
syscall
move 	$t0, $v0

# t3 = t4 + t5 – t6;  	(t4=20, t5 =12, t6=16)
li	$t4, 20
li	$t5, 12
li	$t6, 16
add	$t3, $t4, $t5		#t3 = t4 + t5
sub	$t3, $t3, $t6 

# s0 = -1 * s0;		(s0=13)


# s4 = s4 * 8;		(s4=11)
li	$t1, 8
mult 	$s4, $t1
mflo 	$s4

sll	$s4, $s4, 3

# t3 = t3 / 4		(t3=28)
srl	$t3, $t3, 2


# s3 = t2 / (s1 – 3); 	(s1=5, t2=18)
addi	$s3, $s1, -3
div	$t2, $s3
mflo	$s3
  
# Show how the following pseudocode expression can be 
# efficiently implemented in MIPS assembly language:
# $t0 = $s0 / 8 - 2 * $s1 + $s2;

li 	$t1, 8
li 	$t2, 2
div	$s0, $t1
mflo	$t3
mult	$t2, $s1
mflo 	$t4		# t3 = s0/8
sub	$t5, $t3, $t4
add 	$t0, $t5, $s2


srl	$t3, $s0, 3
sll	$t4, $s1, 1
sub	$t5, $t3, $t4
add 	$t0, $t5, $s2

