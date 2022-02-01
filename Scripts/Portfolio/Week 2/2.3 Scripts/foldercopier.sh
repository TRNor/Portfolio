#!/bin/bash
# foldercopier.sh - A basic script to copy a folder from one directory to another enabling the user to rename the new folder in the process.
# Author: Thomas Norman
# Date Modified: 1/February/2022
# ------------------------------------------------------------------------------------------

# Purpose: Prompt user to enter the name of the folder they would like to copy.

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


# References
# Dr. Dhir Shuchi (2022, January 24). Blog Post, Response to post by Thomas Norman "2.3 foldercopier trouble" Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blogs-journals/execute/viewBlog?course_id=_662967_1&blog_id=_151734_1&blog_course_user_id=_25217595_1&type=blogs&group_id=_199037_1&gml_reload=no&callBackUrl=&allMembers=false#entry_315687_1