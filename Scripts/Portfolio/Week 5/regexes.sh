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
    grep -r "sed " /home/student/ThomasNorman/Scripts/Portfolio/
    echo -e "${red}1) TBD${reset}" && sleep 5s
}

# all lines that start with the letter m
all_m ()
{
    $1 | grep -r "^m"
    echo -e "${red}2) TBD${reset}" && sleep 3s
}

# all lines that contain three digit numbers
all_3digit ()
{
    echo -e "${red}3) TBD${reset}" && sleep 1s
}

# all echo statements with at least three words
all_echo3w ()
{
    echo -e "${red}4) TBD${reset}" && sleep 1s
}

# all lines that would make a good password (use your knowledge of cybersecurity to decide what makes a good password).
all_goodPW ()
{
    echo -e "${red}5) TBD${reset}" && sleep 1s
}

#------------------------------------------------------------------------------------------------------------------------
# MAIN LOGIC - INFINITE LOOP
#------------------------------------------------------------------------------------------------------------------------
while true
do
    menu
done

exit 0