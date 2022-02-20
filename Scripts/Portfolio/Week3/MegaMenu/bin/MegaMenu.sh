#!/bin/bash
# megamenu.sh - A larger script that presents the user with a user friendly interactive menu that can be quit at any time by the user and allows the user to open multiple other scripts.
# Author: Thomas Norman
# Date Modified: 4 February 2022
# ------------------------------------------------------------------------------------------

# Purpose: Define Global Variables

red="\e[0;91m"
blue="\e[0;94m"
green_bd="\e[1;32m"
green="\e[0;92m"
yellow="\e[0;33m"
cyan="\e[0;36m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

EXIT=0

clear

# Purpose: Check Password
( "$(dirname $(dirname $(dirname $(dirname $(realpath $0)))))/Week2/PasswordCheck/bin/PasswordCheck.sh" )

# If password is correct then start program after 0.5 seconds.

if [ $? = 0 ]; then

sleep 0.5s

clear

while [ "$EXIT" -eq 0 ]
do

# Purpose: Print menu to screen
#clear
echo -e "Mega Menu" | figlet
echo ""
echo -e "${green_bd}Select an option: ${reset}"
echo -e "${cyan} 1) Create a folder"
echo -e " 2) Copy a folder"
echo -e " 3) Reset the password"
echo -e " 4) Calculator"
echo -e " 5) Create week folders"
echo -e " 6) Check filenames"
echo -e " 7) Download a file${reset}"
echo -e "${yellow} Q) QUIT${reset}"
echo ""

# Purpose: Save user selection to variable
read -p '' userSelection

# Purpose: Select appropriate script based on users selection (case statement)

case $userSelection in
1)
    # Create a folder
    ( "$(dirname $(dirname $(dirname $(dirname $(realpath $0)))))/Week2/foldermaker.sh" )
    sleep 1s
    clear
;;
2)
    # Copy a folder
    ( "$(dirname $(dirname $(dirname $(dirname $(realpath $0)))))/Week2/foldercopier.sh" )
    sleep 1s
    clear
;;
3)
    # Reset the password
    ( "$(dirname $(dirname $(dirname $(dirname $(realpath $0)))))/Week2/PasswordCheck/bin/PasswordReset.sh" )
    sleep 2s
    clear
;;
4)
    # Calculator
    ( "./Portfolio/Week 3/bashCalculator.sh" )
    sleep 1s
    clear
;;
5)
    # Create week folders
    ( "./Portfolio/Week 3/megafoldermaker.sh" )
    sleep 1s
    clear
;;
6)
    # Check filenames
    ( "./Portfolio/Week 3/filenames.sh" )
    sleep 3s
    clear
;;
7)
    # Download a file
    ( "./Portfolio/Week 3/webDownloader.sh" )
    sleep 1s
    clear
;;
Q)
    # Quit
    clear
    echo "Program quit successfully."
    break
;;
#Default Case
*)
    # Print error message
    clear
    echo -e "${red}INVALID USER INPUT!${reset}"
    sleep 1s
    clear
;;
esac

done

else
    :
fi

exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. 17 January 2022. 3.6 Mega menu. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274259_1&mode=view
# CHADWICK, R. 2022. Bash Scripting Tutorial - 6. Loops. ryanstutorials.net. https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php
