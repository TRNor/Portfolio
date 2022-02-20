#!/bin/bash
# menu.sh - A basic script that presents the user with a selection of scripts they can run from a text based menu.
  # The menu is password protected.
  # If the user enters the correct password, they will be presented with 3 options, to either create a folder, copy a folder or set a new password.
  # The script calls the other corresponding script based on the users selection.
# Author: Thomas Norman
# Date Modified: 1/February/2022
# ------------------------------------------------------------------------------------------

# Purpose: Run passwordCheck script

( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/passwordCheck.sh" )

# Purpose: Check exit code of passwordCheck script. If paccess is granted ($? = 0) then print menu options to screen. else print password was incorrect.

if [[ $? -eq 0 ]]; then
    clear
    echo "1. Create a folder"
    echo "2. Copy a folder"
    echo "3. Set a password"
else
    echo "The password you entered was incorrect"
fi

# Purpose: Read users input to "userSelection" variable.

read userSelection

# Purpose: Run appropriate script based on users selection using a case statement.

case $userSelection in

  1)
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/foldermaker.sh" )
    ;;

  2)
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/foldercopier.sh" )
    ;;

  3)
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/resetPassword.sh" )
    ;;

  *)
    echo -n "unknown"
    ;;
esac

#Purpose: Write 0 to exit code special variable.

exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. (2022, January 17). menu.sh. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274250_1
