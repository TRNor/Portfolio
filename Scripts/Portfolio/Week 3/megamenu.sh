#!/bin/bash
# megamenu.sh - A larger script that presents the user with a user friendly interactive menu that can be quit at any time by the user and allows the user to open multiple other scripts.
# Author: Thomas Norman
# Date Modified: 4 February 2022
# ------------------------------------------------------------------------------------------

# Purpose: Define Global Variables

red="\e[0;91m"
blue="\e[0;94m"
blue_bd="\e[1;34m"
green="\e[0;92m"
yellow="\e[0;33m"
cyan="\e[0;36m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

EXIT=0

clear

# Purpose: Check Password

( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/passwordCheck.sh" )

# If password is correct then start program

# Purpose: Print menu to screen
function
echo -e "Mega Menu" | figlet
echo ""
echo -e "${blue_bd}Select an option: ${reset}"
echo -e "${cyan} 1) Create a folder"
echo -e " 2) Copy a folder"
echo -e " 3) Set a password"
echo -e " 4) Calculator"
echo -e " 5) Create week folders"
echo -e " 6) Check filenames"
echo -e " 7) Download a file${reset}"
echo -e "${yellow} 8) QUIT${reset}"
echo ""

while [ "$EXIT" -eq 0 ]
do
# Purpose: Save user selection to variable

read -p '' userSelection

# Purpose: Select appropriate script based on users selection (case statement)

case $userSelection in
1)
    # Create a folder
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/foldermaker.sh" )
    clear
;;
2)
    # Copy a folder
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/foldercopier.sh" )
    clear
;;
3)
    # Reset the password
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/resetPassword.sh" )
    clear
;;
4)
    # Calculator
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 3/bashCalculator.sh" )
    clear
;;
5)
    # Create week folders
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 3/megafoldermaker.sh" )
    clear
;;
6)
    # Check filenames
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 3/filenames.sh" )
    clear
;;
7)
    # Download a file
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 3/webDownloader.sh" )
    clear
;;
8)
    # Quit
;;
#Default Case
*)
    # Print error message
;;
esac

done

exit 0



# ------------------------------------------------------------------------------------------
# References
# {Last Name}, {First Name Initial}. {date published}. {name of referenced material}. {name of location of referenced material}. {URL of referenced material}
