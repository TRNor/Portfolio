#!/bin/bash
# bashCalculator.sh - A simple calculator script that can perform addition, subtraction, multiplication and division arithmetic functions.
# Author: Thomas Norman
# Date Modified: 2 February 2022
# ------------------------------------------------------------------------------------------

# Purpose: Define Global Variables

red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
yellow="\e[0;33m"
purple="\e[0;35m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"


# Purpose: Print Menu to screen and prompt user to select arithmetic operand.

echo -e "${uline}${bold} Bash Calculator ${reset}"
echo -e "1. ${blue}Addition (+)${reset}"
echo -e "2. ${green}Subtraction (-)${reset}"
echo -e "3. ${yellow}Multiplication (x)${reset}"
echo -e "4. ${purple}Division (/)${reset}"
echo ""

# Purpose: Prompt user to select an arithmetic operand printed above and assign to variable "operandSelection".

read -p 'Please select which arithmetic operand you wish to use: ' operandSelection

# Purpose: Assign users choice to a variable (with various acceptable user inputs to indicate operand choice).

if [ "$operandSelection" = "1" ] || [ "$operandSelection" = "add" ] || [ "$operandSelection" = "Add" ] || [ "$operandSelection" = "addition" ] || [ "$operandSelection" = "Addition" ] || [ "$operandSelection" = "+" ]; then
    operandVar="add"
elif [ "$operandSelection" = "2" ] || [ "$operandSelection" = "subtract" ] || [ "$operandSelection" = "Subtract" ] || [ "$operandSelection" = "subtraction" ] || [ "$operandSelection" = "Subtraction" ] || [ "$operandSelection" = "-" ]; then
    operandVar="subtract"
elif [ "$operandSelection" = "3" ] || [ "$operandSelection" = "multiply" ] || [ "$operandSelection" = "Multiply" ] || [ "$operandSelection" = "multiplication" ] || [ "$operandSelection" = "Multiplication" ] || [ "$operandSelection" = "x" ]; then
    operandVar="multiply"
elif [ "$operandSelection" = "4" ] || [ "$operandSelection" = "divide" ] || [ "$operandSelection" = "Divide" ] || [ "$operandSelection" = "division" ] || [ "$operandSelection" = "Division" ] || [ "$operandSelection" = "/" ]; then
    operandVar="divide"
else
    echo "${red}Error! You have made an invalid entry${reset}"
fi

# Purpose:  If statement 

if [ "$operandVar" = "add" ]; then
    echo "Please enter the first number you wish to $operandVar to"
elif [ "$operandVar" = "subtract" ]; then
    echo " Please enter the first number you wish to $operandVar from"
elif [ "$operandVar" = "multiply" ]; then
    echo " Please enter the first number you wish to $operandVar with"
elif [ "$operandVar" = "divide" ]; then
    echo " Please enter the first number you wish to $operandVar from"
else
    echo "${red}Error! Something went wrong with the operandVar if statement${reset}"
fi















# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. 17 January 2022. 3.2 Use arithmetic expressions to do calculations in scripts. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274255_1
# Antonio (GameTheory). 3 October 2019. BASH tips and snippets. techStop. https://techstop.github.io/bash-script-colors/
