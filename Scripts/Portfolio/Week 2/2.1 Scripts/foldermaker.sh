#!/bin/bash
# foldermaker.sh - A basic script to make a new directory prompting the user to enter the folder name.
# Author: Thomas Norman
# Date Modified: 1/February/2022
# ------------------------------------------------------------------------------------------

# Purpose: Prompt the user to enter a foldername for the new folder they are creatin and assign the entered value to the variable "folderName"

read -p 'Type the name of the folder you would like to create: ' folderName

# Purpose: Make a new directory with the name entered by the user read from teh "folderName" variable.

mkdir "$folderName"

# Purpose: Assign the exit code special variable as 0.

exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. (2022, January 17). foldercopier.sh. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274246_1&mode=view
