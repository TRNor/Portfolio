#!/bin/bash

#Ask the user to enter a new password ensuring their input is hidden.
read -sp 'Please enter your new password: ' password
#Hash password input by the user and write it to a file named secret.txt.
echo "$password" | sha256sum > secret.txt
#User feedback
echo
echo "Your password was successfully changed."

exit 0
