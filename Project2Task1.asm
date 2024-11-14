#Program 2: Practice with conditionals and loops
#John Stewart
#CS2640
#11/13/2024
#Github Repo: https://github.com/CS2640-Projects/Project2



#Macros

.macro menu
	li $v0, 4
	la $a0, menuText
	syscall
.end_macro 

.macro checkAgain
	li $v0, 4
	la $a0, checkAgainText
	syscall
	li $v0, 12
	syscall
	move $t0, $v0
	
	beq $t0, 'Y', getData
	beq $t0, 'y', getData
	beq $t0, 'N', loop
	beq $t0, 'n', loop
.end_macro

.macro checkData
	bge $s0, 90, giveGradeA
	bge $s0, 80, giveGradeB
	bge $s0, 70, giveGradeC
	bge $s0, 60, giveGradeD
	bge $s0, 0, giveGradeF
.end_macro




.data
menuText: .asciiz "\n~~~~~~~~~~~~~~~MAIN MENU~~~~~~~~~~~~~~~\n(1)Get Letter Grade\n(2)Exit Program\n\nEnter '1' or '2' for your selection: "
checkAgainText: .asciiz "\n\n---------------------------------------\nWould you like to enter a new score?\n(Y)Yes  (N)No"
prompt: .asciiz "\n---------------------------------------\n\nPlease enter a score as an integer value:\n"
output: .asciiz "The output is: "
invalidInput: .asciiz "\nThe entered value is invalid, try again...\n"
Agrade: .asciiz "A"
Bgrade: .asciiz "B"
Cgrade: .asciiz "C"
Dgrade: .asciiz "D"
Fgrade: .asciiz "F"

.text
main:
#Write an Assembly program that will return a letter grade given a Decimal int from the user. Include the following:
#a user menu
# main label, a looping label, and an exit label
#a way for the user to continue getting letter grades or choose to exit
#invalid input handling (do NOT just print an error message and exit the program; re-prompt the user until a correct input is entered)
	
#Runs until the user provides '2' as their input
loop:
	
	menu
	li $v0, 12
	syscall
	move $t0, $v0
	beq $t0, '2', exit
	beq $t0, '1', getData
	j invalidUserInput

#Gets a user inpout and moves it to $s0 to be checked for proper grade value	
getData:
	li $v0, 4
	la $a0, prompt
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	checkData 
	j invalidUserInput
	
#Prints A as the users grade
giveGradeA:
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 4
	la $a0, Agrade
	syscall
	checkAgain
	
#Prints B as the users grade
giveGradeB:
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 4
	la $a0, Bgrade
	syscall
	checkAgain

#Prints C as the users grade
giveGradeC:
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 4
	la $a0, Cgrade
	syscall
	checkAgain
	
#Prints D as the users grade
giveGradeD:
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 4
	la $a0, Dgrade
	syscall
	checkAgain

#Prints F as the users grade
giveGradeF:
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 4
	la $a0, Fgrade
	syscall
	checkAgain

#Prints if the users input is invalid, returs to top of loop to start again	
invalidUserInput:
	li $v0, 4
	la $a0, invalidInput
	syscall
	j loop

#exits the program	
exit:
	li $v0, 10
	syscall

