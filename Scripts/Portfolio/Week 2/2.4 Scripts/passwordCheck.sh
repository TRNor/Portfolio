#!/bin/bash
# foldercopier.sh - 
    # This program looks at an existing password hash stored in a text file (secret.txt) and compares it with a user's entered password.
    # If the user enters the correct password, the program prints "Access Granted" to screen and has an exit code 0.
    # If the user enters an incorrect password, the program prints "Access Denied" to screen and has an exit code 1.
    # The code contains commented out tests for each stage of code for development and debugging purposes.
    # The correct password is "myPassword"
# Author: Thomas Norman
# Date Modified: 1/February/2022
# ------------------------------------------------------------------------------------------

# Purpose: Assign stored password hash to variable 'passHashStored'

passHashStored=$(cat secret.txt)

# Purpose: Prompt the user to enter a password (hidden) and assign this entry to the variable 'passwordEntered'

read -sp 'Please enter your password: ' passwordEntered
echo

# Purpose: Hash and send that input to the variable 'passHashEntered'.

passHashEntered=$(echo "$passwordEntered" | sha256sum)

# Purpose: Check the hash of the password entered by the user against the hash stored in 'secret.txt'.

if [[ "$passHashEntered" == "$passHashStored" ]]; then

	# Purpose: If the user's password is correct, print "Access Granted" and quit with the exit code 0.

	echo "Access Granted"

	exit 0

else

	# Purpose: If the password is incorrect, print "Access Denied" and quit with the exit code 1.

	echo "Access Denied"

		exit 1

fi

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. (2022, January 17). passwordCheck.sh. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274249_1