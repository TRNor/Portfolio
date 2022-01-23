#!/bin/bash

#----------------------------------------------------------
#This program looks at an existing password hash stored in a text file (secret.txt) and compares it with a user's entered password.
#If the user enters the correct password, the program prints "Access Granted" to screen and has an exit code 0.
#If the user enters an incorrect password, the program prints "Access Denied" to screen and has an exit code 1.
#The code contains commented out tests for each stage of code for development and debugging purposes.
#The correct password is "myPassword"
#----------------------------------------------------------

#Assign stored password hash to variable 'passHashStored'

passHashStored=$(cat secret.txt)

	#Test:
	#echo "Hash of stored password is: $passHashStored"

#------------------------

#Ask the user to type a secret password (hide the input)
#Prompt the user to enter a password and assign this entry to the variable 'passwordEntered'

read -sp 'Please enter your password: ' passwordEntered
echo

	#Test:
	#echo 
	#echo "You entered the password: $passwordEntered"

#------------------------

#Hash and send that input to the variable 'passHashEntered'

passHashEntered=$(echo "$passwordEntered" | sha256sum)

	#Test:
	#echo "Hash of your entered password is: $passHashEntered"

#------------------------

#Check the hash of the password entered by the user against the hash stored in 'secret.txt'

if [[ "$passHashEntered" == "$passHashStored" ]]; then

#If the user's password is correct, print "Access Granted" and quit with the exit code 0

	echo "Access Granted"
	exit 0

#: If the user's password is incorrect, print "Access Denied" and quit with the exit code 1
	#TESTED WORKS

else

	echo "Access Denied"
	exit 1

fi

#----------------------------------------------------------