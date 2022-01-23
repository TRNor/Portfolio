#!/bin/bash

#Ask the user to type a secret password (hide the input)

read -sp 'Please enter your password: ' password

#Hash entered password for later comparison

echo "$password" | sha256sum > passwordHash

#Check the users password against the hash stored in 'secret.txt'


if [[ "$passwordHash" -eq cat secret.txt ]]; then

#If the user's password is correct, print "Access Granted" and quit with the exit code 0

	echo "Access Granted"
	exit 0

#: If the user's password is incorrect, print "Access Denied" and quit with the exit code 1

else

	echo "Access Denied"
	exit 1

fi
