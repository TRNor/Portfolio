#!/bin/bash

#Assign stored password hash to variable 'passHashStored'
passHashStored=$(cat secret.txt)

echo "Hash of stored password is: $passHashStored"

#Ask the user to type a secret password (hide the input)
#Prompt the user to enter a password and assign this entry to the variable 'passwordEntered'

read -sp 'Please enter your password: ' passwordEntered

echo 

echo "You entered the password: $passwordEntered"

#Hash and send that input to the variable 'passHashEntered'

#echo "$passwordEntered" | sha256sum > passHashEntered
passHashEntered=$(echo "$passwordEntered" | sha256sum)

echo "Hash of your entered password is: $passHashEntered"

#Check the user's password against the hash stored in 'secret.txt'
	#Pull password hash from secret.txt to variable 'passwordStored'



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
