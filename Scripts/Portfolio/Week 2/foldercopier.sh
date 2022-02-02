#!/bin/bash
# foldercopier.sh - A basic script to make a copy of a folder enabling the user to rename the new folder in the process.
# Author: Thomas Norman
# Date Modified: 1/February/2022
# ------------------------------------------------------------------------------------------

# Purpose: Prompt user to enter the name of the folder they would like to copy and assign this value to the variable "folderName".

read -p "Type the name of the folder you would like to copy: " folderName

# Purpose: Check if the name entered by user is a valid directory.

if [ -d "$folderName" ]; then

	# Purpose: If valid, prompt user to enter name of new folder and copy first folder to new directory with new name.
	
	read -p "type the name of the destination folder: " newFolderName

	cp -r "$folderName" "$newFolderName"

else

	# Purpose: If invalid, print an error.
	
	echo "I couldn't find that folder"

fi

# Purpose: Report a successful execution of the script to the exit code special variable.

exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. (2022, January 17). foldercopier.sh. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274248_1&mode=view