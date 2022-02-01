#!/bin/bash
# setPassword.sh - A basic script to make a folder, create a password and write the password to a .txt file in the newly created folder.
# Author: Thomas Norman
# Date Modified: 1/February/2022
# ------------------------------------------------------------------------------------------

# Purpose: Ask user to enter the name of the folder they want to create.

read -p 'Please enter a folder name: ' folderName

# Purpose: Make a new directory using the name input by the user.

mkdir "$folderName"

# Purpose: Ask the user to enter a password ensuring their input is hidden.

read -sp 'Please enter your password: ' password

# Purpose: Hash password input by the user and write it to a file named secret.txt.

echo "$password" | sha256sum > secret.txt

# Purpose: Move secret.txt file into the user defined folder.

mv secret.txt $folderName

# Purpose: Assign 0 to exit code special variable.

exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. (2022, January 17). setPassword.sh. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274247_1&mode=view