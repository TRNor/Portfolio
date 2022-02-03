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

activeNum=0

# Purpose: Print Menu to screen and prompt user to select arithmetic operand.

echo -e "${uline}${bold} Bash Calculator ${reset}"
echo -e "${blue}1. Addition (+)${reset}"
echo -e "${green}2. Subtraction (-)${reset}"
echo -e "${red}3. Multiplication (x)${reset}"
echo -e "${purple}4. Division (/)${reset}"
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
    echo -e "${bold}${red}Error! You have made an invalid entry${reset}"
fi

# Purpose:  If statement to run appropriate mathematical calculation based on user's input.

if [ "$operandVar" = "add" ]; then
    # Purpose: Prompt user for input of two numbers, then calculate the addition of the two numbers and assign the result to a variable "activeNum" and print the result.
    read -p "Please enter the two numbers you wish to $operandVar: " firstNum secondNum
    activeNum=$(expr "$firstNum" + "$secondNum")
    echo ""
    echo -e "${yellow}Result: $firstNum ${blue}+${yellow} $secondNum = $activeNum"
elif [ "$operandVar" = "subtract" ]; then
    # Purpose: Prompt user for input of two numbers, then calculate the addition of the two numbers and assign the result to a variable "activeNum" and print the result.
    read -p "Please enter the number you wish to $operandVar from followed by the number you wish to $operandVar by: " firstNum secondNum
    activeNum=$(expr "$firstNum" - "$secondNum")
    echo ""
    echo -e "${yellow}Result: $firstNum ${green}-${yellow} $secondNum = $activeNum"
elif [ "$operandVar" = "multiply" ]; then
    # Purpose: Prompt user for input of two numbers, then calculate the addition of the two numbers and assign the result to a variable "activeNum" and print the result.
    read -p "Please enter the number you wish to $operandVar with followed by the number you wish to $operandVar by: " firstNum secondNum
    activeNum=$(expr "$firstNum" \* "$secondNum")
    echo ""
    echo -e "${yellow}Result: $firstNum ${red}x${yellow} $secondNum = $activeNum"
elif [ "$operandVar" = "divide" ]; then
    # Purpose: Prompt user for input of two numbers, then calculate the addition of the two numbers and assign the result to a variable "activeNum" and print the result.
    read -p "Please enter the number you wish to $operandVar followed by the number you wish to $operandVar by: " firstNum secondNum
    activeNum=$(expr "$firstNum" / "$secondNum")
    echo ""
    echo -e "${yellow}Result: $firstNum ${purple}/${yellow} $secondNum = $activeNum${reset}"
else
    echo -e "${bold}${red}Error! Something went wrong with the operandVar if statement${reset}"
fi















# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. 17 January 2022. 3.2 Use arithmetic expressions to do calculations in scripts. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274255_1
# Antonio (GameTheory). 3 October 2019. BASH tips and snippets. techStop. https://techstop.github.io/bash-script-colors/
