#Program 2: Practice with conditionals and loops
#John Stewart
#CS2640
#11/13/2024
#Github Repo: https://github.com/CS2640-Projects/Project2

#Data to be used by the program
.data
prompt1: .asciiz "This program asks the user to input a value for 'x' and 'y'.\nThen, it finds the value of x to the power of y.\nFor example, 2 to the power of 3 is 8.\n\n\n"
prompt2: .asciiz "Enter a number for 'x': "
prompt3: .asciiz "Enter a number for 'y': "
printResult: .asciiz "'x' to the power of 'y' is: "

.text
main:
	#prints prompt1
	li $v0, 4
	la $a0, prompt1
	syscall
	
	#prints prompt2
	li $v0, 4
	la $a0, prompt2
	syscall
	
	#gets user input, stores it in $s0
	li $v0, 5
	syscall
	move $s0, $v0
	
	#prints prompt3
	li $v0, 4
	la $a0, prompt3
	syscall
	
	#gets user input and stores it in $s1
	li $v0, 5
	syscall
	move $s1, $v0
	
	#initializes $t0 and $t0 for later  usage
	li $t0, 0
	li $t1, 1
	
#loop that runs 'y' amount of times and branches to continue after
loop:
	beq $t0, $s1, continue
	mul $t1, $t1, $s0
	addi $t0, $t0, 1
	j loop

#continues when the loop is finished
continue:
	#prints printResult
	li $v0, 4
	la $a0, printResult
	syscall
	
	#pritns the value in $t1
	li $v0, 1
	move $a0, $t1
	syscall
	j exit
	
#exits the program
exit:
	li $v0 10
	syscall