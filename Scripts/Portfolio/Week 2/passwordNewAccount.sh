#!/bin/bash
# passwordNewAccount.sh - A subscript of passwordCheck.sh that enables a user to create a new account username and password.
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

# Purpose: Print header to screen
clear
echo -e "passwordCheck" | figlet
echo -e "Version: 1.0"
echo -e "Author: Thomas Norman"
echo -e "${green_bd}Create A New Account${reset}"
echo ""

# Purpose: Prompt user to create a new username

read -p "Please enter a new username: " usernameEntered

# Purpose: Scan the 'User' directory and add all .txt files into an array 'users'
users=$(ls /home/student/ThomasNorman/Scripts/Portfolio/Week\ 2/passwordUsers)

# Purpose: cut off ".txt" from strings 'usernames' in array 'users'
for i in ${users[@]};
do
    users="$(cut -d "." -f 1 $i)"
    #users="$(echo "$i" | cut -f 1 -d '.')"
    #cut -d " " -f 1 state.txt
done

for i in ${users[@]};
do
    echo "User: $i"
done

# Purpose: Check if username already taken.

for k in ${users[@]};
do
    # If already taken, inform user to try again
    if [ usernameEntered = "$k" ]; then
        echo "${red}Error: That username is already taken. Please try again.${reset}"
    # Else inform user, their choice is available and create new .txt file with their entered username as the filemame in the passwordUsers directory.
    else
        echo "That username is available"
        touch $usernameEntered.txt | /home/student/ThomasNorman/Scripts/Portfolio/Week\ 2/passwordUsers
fi
done

# Purpose: Check if username Entered already exists

    # If it already exists, inform user to try a different username and loop back for user to try again

    # If it doesnt exist, inform user that username is available and create new .txt file with entered username as file name in the users directory.
    echo >${userDir}/$usernameEntered.txt

# Purpose: Select appropriate script based on users selection (case statement)

sleep 10s


done

exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. 17 January 2022. 3.6 Mega menu. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274259_1&mode=view
# CHADWICK, R. 2022. Bash Scripting Tutorial - 6. Loops. ryanstutorials.net. https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php