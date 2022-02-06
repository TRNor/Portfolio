#!/bin/bash
# passwordMenu.sh - A menu script for passwordCheck.sh.
# Author: Thomas Norman
# Date Modified: 6 February 2022
# ------------------------------------------------------------------------------------------

# Purpose: Define Variables
    # Text Formatting Variables
red="\e[0;91m"
blue="\e[0;94m"
green_bd="\e[1;32m"
green="\e[0;92m"
yellow="\e[0;33m"
cyan="\e[0;36m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"
    # Global Variables
EXIT=0

while [ "$EXIT" -eq 0 ]
do

# Purpose: Print menu to screen
clear
echo -e "passwordCheck" | figlet
echo -e "Version: 1.0"
echo -e "Author: Thomas Norman"
echo -e "${uline}                                                               ${reset}"
echo -e "${uline}|                  Login/Create New Account                   |${reset}"
echo -e "${green_bd}Select an option: ${reset}"
echo -e "${cyan} 1) Login"
echo -e " 2) Create New Account"
echo -e "${yellow} Q) Quit${reset}"
echo -e "${uline}                                                               ${reset}"
echo ""

# Purpose: Save user selection to variable
read -p '' userSelection

# Purpose: Select appropriate script based on users selection (case statement)

case $userSelection in
1)
    # Call login.sh script
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/passwordLogin.sh" )
;;
2)
    # Call createAccount.sh
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/passwordNewAccount.sh" )
;;
Q)
    # Return to Main Menu
    clear
    echo "Program quit successfully."
    clear
    EXIT=1
;;
#Default Case
*)
    # Print error message
    echo -e "${red}INVALID USER INPUT!${reset}"
    sleep 1s
    clear
;;
esac

done

exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. 17 January 2022. 3.6 Mega menu. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274259_1&mode=view
# CHADWICK, R. 2022. Bash Scripting Tutorial - 6. Loops. ryanstutorials.net. https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php