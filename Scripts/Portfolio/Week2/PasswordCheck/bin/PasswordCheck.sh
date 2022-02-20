#!/bin/bash
# PasswordCheck.sh - A user account and password script enabling a user to enter login or create a new account, setting a username and password.
#				   - This script can be used as user validation before accessing a database or other script.
# Author: Thomas Norman
# Date Modified: 1/February/2022
# -----------------------------------------------------------------------------------------------------------------------

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

#------------------------------------------------------------------------------------------------------------------------
# MENU FUNCTIONS
#------------------------------------------------------------------------------------------------------------------------
# ACCOUNT MENU
#-------------
menu_Account () {
    # Print menu
    clear
    echo -e "PasswordCheck" | figlet
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

    # Save user selection to variable
    read userSelection

    # Select appropriate function to run based on user selection
    case $userSelection in
        1) login ;;
        2) createAccount ;;
        Q) exit 0 ;;
        *) echo -e "${red}INVALID USER INPUT!${reset}" && sleep 1s && menu_Account ;;
    esac
}

#------------------------------------------------------------------------------------------------------------------------
# ACCOUNT FUNCTIONS
#------------------------------------------------------------------------------------------------------------------------
# LOGIN
#------
login () {
    # Define variables
    userDir="$(dirname $(dirname $(realpath $0)))/Users"
    EXIT1=0
    EXIT2=0

    # Loop until successfully logged in - Exit to menu_Main function.
    while [ $EXIT1=0 ]
    do
        #~~~~~~~~~~~~~~~
        # ENTER USERNAME
        #~~~~~~~~~~~~~~~
        read -p 'Please enter YOUR username: ' usernameEntered

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
        # Inform user if username exists or not. If does not exist, print error and ask if user wants to create new account or loop back to attempt username entry again. 
        # If it does exist, inform user of success and prompt user to enter password.

        if [ $usernameExists -eq 1 ]; then
            # Prompts user to enter password and check against record stored in 'username'.txt. Loops back if password is incorrect.
            # ***TO ADD: add feature where loops 5 times of incorrect password before introducing a 1 minute delay for each subsquent incorrect password attempt.
            while [ $EXIT2=0 ]
            do
                # Assign stored password hash to variable 'passHashStored'
                passHashStored="$(cat "$(dirname $(dirname $(realpath $0)) )/Users"/$usernameEntered.txt)"

                # Prompt the user to enter a password (hidden) and assign this entry to the variable 'passwordEntered'
                read -sp 'Please enter YOUR password: ' passwordEntered

                # Hash and send that input to the variable 'passHashEntered'.
                passHashEntered=$(echo "$passwordEntered" | sha256sum)

                # Check the hash of the password entered by the user against the hash stored in 'secret.txt'.
                #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                # PASSWORD CORRECT - EXIT SUCCESS
                #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                if [[ "$passHashEntered" == "$passHashStored" ]]; then
        	        # If the user's password is correct, print "Access Granted" and quit with the exit code 0.
	                echo -e "\n${green}Access Granted!${reset}"
                    EXIT2=1
                    EXIT1=1
	                exit 0
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
                echo -ne "Do you wish to create a new account ${green}Y${reset}/${red}N${reset}: "
                read createNewAccount
            #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            # CREATE NEW ACCOUNT - YES - LAUNCH createAccount.sh
            #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            if [ "$createNewAccount" = "Y" ]; then
                createAccount
                EXIT1=1
                return 0
            #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            # CREATE NEW ACCOUNT - NO - LOOP BACK TO RE-ENTER USERNAME
            #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            elif [ "$createNewAccount" = "N" ]; then
                EXIT2=0
                EXIT1=0
            else
                echo -e "${red}ERROR: Invalid user input. Please try agian.${reset}"
            fi
        fi
    done
}

#---------------
# CREATE ACCOUNT
#---------------
createAccount () {
    # Define Variables
    usernameExists=0
    userDir="$(dirname $(dirname $(realpath $0)) )/Users"
    EXIT=0

    # Loop until account successfully created - Exit to login function
    while [ $EXIT=0 ]
        do
        #~~~~~~~~~~~~~~~~~~~~~
        # ENTER A NEW USERNAME
        #~~~~~~~~~~~~~~~~~~~~~
        # Prompt user to enter a new username.

        read -p "Please enter a NEW username: " usernameEntered

        #~~~~~~~~~~~~~~~~
        #USERNAME EXISTS?
        #~~~~~~~~~~~~~~~~
        # Scan the 'User' directory and add all .txt files into an array 'users'

        users=$(ls "$userDir")
        usersMod=()

        # Cut off ".txt" from strings 'usernames' in array 'users' (Ref 3)
        # ***Turn this into a function.

        for i in ${users[@]};
        do
            usersMod+=("${i%.*}") 
        done

        # Check if username exists by checking 'User' directory for a .txt file with the file name matching the entered username.
        # ***Turn this into a function.
        for j in ${usersMod[@]};
        do
            if [ "$usernameEntered" == "$j" ]; then
                usernameExists=1
                break
            else
                usernameExists=0
            fi
        done

        # Inform user if username exists or not. If it exists, print error and loop back to let user try again. 
        # If it doesnt exist, inform user of success and create 'username'.txt in users directory.
        if [ $usernameExists -eq 1 ]; then
            echo -e "${red}ERROR: This username already exists, please try again.${reset}"
        else
            echo -e "${green}Your username has been successfully created as: $usernameEntered.${reset}"
            touch $userDir/$usernameEntered.txt

            #~~~~~~~~~~~~~~~~~~~
            # ENTER NEW PASSWORD
            #~~~~~~~~~~~~~~~~~~~
            # Prompt the user to enter a password (hidden) and assign this entry to the variable 'passwordEntered'
            # TO ADD: Add feature where password is never stored as plain text in a variable but directly hashed before being written to anything.
            read -sp 'Please enter a NEW password: ' passwordEntered

            # Hash and send that input to the variable 'passHashEntered'.
            passHashEntered=$(echo "$passwordEntered" | sha256sum)

            # Write hashed password to 'username'.txt
            echo "$passHashEntered" >> $userDir/$usernameEntered.txt    

            # Call login.sh to login with new username and password
            clear
            echo -e "${green_bd}Account Successfully Created${reset}"
            sleep 1
            menu_Account
        fi
    done
}

#------------------------------------------------------------------------------------------------------------------------
# MAIN LOGIC - INFINITE LOOP
#------------------------------------------------------------------------------------------------------------------------
while true
do
    menu_Account
done

exit 0

# -----------------------------------------------------------------------------------------------------------------------
# References
# 2.4 Write if statements to control program flow. (2022). https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274249_1
# Bash Scripting Tutorial - 6. Loops. (2022). https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php
# Menu driven scripts. (1999-2017). https://bash.cyberciti.biz/guide/Menu_driven_scripts
# Bash shell path relative to current script. (2019). https://code-maven.com/bash-shell-relative-path
