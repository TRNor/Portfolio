#!/bin/bash

#Ask the user to type a secret password (hide the input)
	#Promt user to enter password, hash and send input password to variable ;
read -sp 'Please enter your password: ' | sha256sum > passwordEntered

#Check the users password against the hash stored in 'secret.txt'

	#Pull password hash from secret.txt to variable 'hashCheck'

echo secret.txt | $hashCheck

if [[ "$passwordHash" -eq "$hashCheck" ]]; then

#If the user's password is correct, print "Access Granted" and quit with the exit code 0

	echo "Access Granted"
	exit 0

#: If the user's password is incorrect, print "Access Denied" and quit with the exit code 1
	#TESTED WORKS
else

	echo "Access Denied"
	exit 1

fi
