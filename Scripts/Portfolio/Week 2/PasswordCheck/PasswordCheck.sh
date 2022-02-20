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
    echo -e "PROGRAM - X" | figlet
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

#----------
# MAIN MENU
#----------
menu_Main () {
    # Print menu
    clear
    echo -e "PROGRAM - X" | figlet
    echo -e "Version: 1.0"
    echo -e "Author: Thomas Norman"
    echo -e "${uline}                                                               ${reset}"
    echo -e "${uline}|                          Main Menu                          |${reset}"
    echo -e "${green_bd}Select an option: ${reset}"
    echo -e "${cyan} 1) Read Me"
    echo -e " 2) Change Password"
    echo -e "${yellow} Q) QUIT${reset}"
    echo -e "${uline}                                                               ${reset}"
    echo ""

    # Save user selection
    read userSelection

    # Select appropriate function to run based on user selection
    case $userSelection in
        1) readme ;;
        2) changePassword ;;
        Q) clear && echo "Program exit successfully" && sleep 1s && clear && exit 0 ;;
        *) echo -e "${red}INVALID USER INPUT!${reset}" && sleep 1s && menu_Main ;;
    esac
}

#------------------------------------------------------------------------------------------------------------------------
# ACCOUNT FUNCTIONS
#------------------------------------------------------------------------------------------------------------------------
# LOGIN
#------
login () {
    # Define variables
    userDir=./Users/    
    EXIT1=0
    EXIT2=0

    # Loop until successfully logged in - Exit to menu_Main function.
    while [ $EXIT1=0 ]
    do
        #~~~~~~~~~~~~~~~
        # ENTER USERNAME
        #~~~~~~~~~~~~~~~
        # Prompt user to enter username.
        read -p 'Please enter YOUR username: ' usernameEntered

        # Scan the 'User' directory and add all .txt files into an array 'users'
        users=$(ls ./Users)
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
                passHashStored="$(cat ./Users/$usernameEntered.txt)"

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
	                menu_Main
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
    userDir=./Users/
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

        users=$(ls ./Users)
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
            echo "$passHashEntered" >> ./Users/$usernameEntered.txt    

            # Call login.sh to login with new username and password
            clear
            echo -e "${green_bd}Account Successfully Created${reset}"
            sleep 1
            menu_Account
        fi
    done
}

#----------------
# CHANGE PASSWORD
#----------------
changePassword () {
    EXIT=0

    while [ $EXIT=0 ]
    do
        read -p "Please enter YOUR username: " usernameEntered
                
        # Assign stored password hash to variable 'passHashStored'
        currentPassHashStored="$(cat ./Users/$usernameEntered.txt)"

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
                        echo "$newPassHashReEntered" > ./Users/$usernameEntered.txt
                        echo -e "${green}Please login again${reset}"
                        EXIT=1
                        login
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
menu_Main
}

#------------------------------------------------------------------------------------------------------------------------
# OTHER FUNCTIONS
#------------------------------------------------------------------------------------------------------------------------
# README
#-------

readme () {
    # Clear screen
    clear
    echo -e "PROGRAM/DATABASE" | figlet
    echo -e "Version: 1.0"
    echo -e "Author: Thomas Norman"
    echo -e "${uline}                                                               ${reset}"
    echo -e "${uline}|                            ReadMe                           |${reset}"
    echo -e "${green_bd}Select an option: ${reset}"
    echo -e "${yellow} M) Main Menu${reset}"
    echo -e "${uline}                                                               ${reset}"
    echo ""
    
    # Print ReadMe instructions from ReadMe.md

    echo -e "${green}ACCESS GRANTED! CONGRATULATIONS :)${reset}"
    echo -e "${uline}                                                               ${reset}"
    echo ""

    # Save user selection
    read userSelection

    case $userSelection in
        M) menu_Main ;;
        *) echo -e "${red}INVALID USER INPUT!${reset}" && sleep 1s && readme ;;
    esac
}


#------------------------------------------------------------------------------------------------------------------------
# MAIN LOGIC - INFINITE LOOP
#------------------------------------------------------------------------------------------------------------------------
while true
do
    if menu_Account ; then
	    menu_Main
    fi
done

exit 0

# -----------------------------------------------------------------------------------------------------------------------
# References
# 2.4 Write if statements to control program flow. (2022). https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274249_1