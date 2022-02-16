#!/bin/bash
# regexes.sh - A basic script that explores regular expressions and the grep command.
# Author: Thomas Norman
# Date Modified: 12 February 2022
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

#------------------------------------------------------------------------------------------------------------------------
# FUNCTIONS
#------------------------------------------------------------------------------------------------------------------------
# Menu
#-----
menu () {
    # Print menu
    clear
    echo -e "regexes.sh" | figlet
    echo -e "Author: Thomas Norman"
    echo -e "${uline}                                                               ${reset}"
    echo -e "${uline}|                           Search                            |${reset}"
    echo -e "${green_bd}Select an option: ${reset}"
    echo -e "${cyan} 1) All sed statements"
    echo -e " 2) All lines that start with the letter m"
    echo -e " 3) All lines that contain 3 digit numbers"
    echo -e " 4) All echo statements with at least 3 words"
    echo -e " 5) All lines that would make a good password"
    echo -e "${yellow} Q) Quit${reset}"
    echo -e "${uline}                                                               ${reset}"
    echo ""

    # Save user selection to variable
    read userSelection

    # Select appropriate function to run based on user selection

    case $userSelection in
        1) all_sed ;;
        2) all_m ;;
        3) all_3digit ;;
        4) all_echo3w ;;
        5) all_goodPW ;;
        Q) exit 0 ;;
        *) echo -e "${red}INVALID USER INPUT!${reset}" && sleep 1s && menu ;;
    esac
}

# All sed statements
all_sed ()
{
    egrep -r "sed " /home/student/ThomasNorman/Scripts/Portfolio/
    read -p "Press [Enter] key to start backup..."
}

# all lines that start with the letter m
all_m ()
{
    egrep -r "^m" /home/student/ThomasNorman/Scripts/Portfolio/
    read -p "Press [Enter] key to start backup..."
}

# all lines that contain three digit numbers
all_3digit ()
{
    egrep -r "(^|[^0-9])[0-9]{3}($|[^0-9])" /home/student/ThomasNorman/Scripts/Portfolio/
    read -p "Press [Enter] key to start backup..."
}

# all echo statements with at least three words
all_echo3w ()
{
    egrep -r '(echo.*"(\S+\s+?){3,}")' /home/student/ThomasNorman/Scripts/
    read -p "Press [Enter] key to start backup..."
}

# all lines that would make a good password (use your knowledge of cybersecurity to decide what makes a good password).
all_goodPW ()
{
    grep -Pr '^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!"#\$%&])[a-zA-Z0-9!"#\$%&]{1,}$' /home/student/ThomasNorman/Scripts/
    read -p "Press [Enter] key to start backup..."
}

#------------------------------------------------------------------------------------------------------------------------
# MAIN LOGIC - INFINITE LOOP
#------------------------------------------------------------------------------------------------------------------------
while true
do
    menu
done

exit 0