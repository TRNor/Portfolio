#!/bin/bash
# resetPassword.sh - A basic script that allows the user to reset a password which is stored in a text file.
# Author: Thomas Norman
# Date Modified: 1/February/2022
# ------------------------------------------------------------------------------------------

# Purpose: Ask the user to enter a new password ensuring their input is hidden.

read -sp 'Please enter your new password: ' password

# Purpose: Hash password input by the user and write it to a file named secret.txt.

echo "$password" | sha256sum > secret.txt

# Purpose: Print user feedback that password was successfully changed.

echo
echo "Your password was successfully changed."

# Purpose: Assign value of 0 to exit code special variable.

exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. (2022, January 17). resetPassword.sh. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274250_1
