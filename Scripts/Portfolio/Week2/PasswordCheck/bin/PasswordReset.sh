#!/bin/bash
# PasswordReset.sh - A basic script that allows the user to reset a password which is stored in a text file.
# Author: Thomas Norman
# Date Modified: 20 February 2022
# ------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------
# DEFINE VARIABLES
#------------------------------------------------------------------------------------------------------------------------
red="\e[0;91m"
blue="\e[0;94m"
green_bd="\e[1;32m"
green="\e[0;92m"
yellow="\e[0;33m"
cyan="\e[0;36m"
bold="\e[1m"
uline="\e[4m"
blue_ul="\e[4;34m"
reset="\e[0m"

#----------------
# CHANGE PASSWORD
#----------------
EXIT1=0
EXIT2=0
userDir="$(dirname $(dirname $(realpath $0)))/Users"

while [ $EXIT1=0 ]
do
    read -p "Please enter YOUR username: " usernameEntered

    # Scan the 'User' directory and add all .txt files into an array 'users'
    users=$(ls "$userDir")
    usersMod=()

    # Cut off ".txt" from strings 'usernames' in array 'users' (Ref 3)
    for i in ${users[@]};
    do
        usersMod+=("${i%.*}") 
    done

    # Check if username exists by checking 'User' directory for a .txt file with the file name matching the entered username.
    for j in ${usersMod[@]};
    do
        if [ "$usernameEntered" == "$j" ]; then
            usernameExists=1
            break
        else
            usernameExists=0
        fi
    done

    #~~~~~~~~~~~~~~~~~
    # USERNAME EXISTS?
    #~~~~~~~~~~~~~~~~~
    if [ $usernameExists -eq 1 ]; then
        while [ $EXIT2=0 ]
        do
            # Assign stored password hash to variable 'passHashStored'
            currentPassHashStored="$(cat "$(dirname $(dirname $(realpath $0)))/Users"/$usernameEntered.txt)"

            # Prompt the user to enter a password (hidden) and assign this entry to the variable 'passwordEntered'

            read -sp 'Please enter your CURRENT password: ' currentPasswordEntered && echo ""

            # Hash and send that input to the variable 'passHashEntered'.
            currentPassHashEntered=$(echo $currentPasswordEntered | sha256sum)

            # Check the hash of the password entered by the user against the hash stored in 'secret.txt'.
            #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            # PASSWORD CORRECT - EXIT SUCCESS
            #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            if [[ "$currentPassHashEntered" == "$currentPassHashStored" ]]; then
	            read -sp 'Please enter your NEW password: ' newPasswordEntered && echo ""
                newPassHashEntered=$(echo $newPasswordEntered | sha256sum)
                read -sp 'Please re-enter your NEW password: ' newPasswordReEntered && echo ""
                newPassHashReEntered=$(echo $newPasswordReEntered | sha256sum)

                if [[ "$newPassHashEntered" == "$newPassHashReEntered" ]]; then
                    echo -e "${green}Your password has been changed${reset}"
                    echo "$newPassHashReEntered" > "$(dirname $(dirname $(realpath $0)))/Users"/$usernameEntered.txt                    
                    EXIT1=1
                    exit 0
                else
                    echo -e "${red}ERROR: The passwords you entered to not match!${reset}"
                fi
            #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            # PASSWORD NOT CORRECT - LOOP BACK
            #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            else
                # If the password is incorrect, print "Access Denied" and prompt user to try again.
                echo -e "\n${red}ERROR: Access Denied! Incorrect password entered. Please try again.${reset}"
            fi
        done

        #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        # USERNAME DOESN'T EXIST - CREATE NEW ACCOUNT?
        #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        else
            echo -e "${red}ERROR: This username does not exist. Please try again.${reset}"
            EXIT1=1
            EXIT2=1
        fi
    done

exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. (2022, January 17). resetPassword.sh. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274250_1
