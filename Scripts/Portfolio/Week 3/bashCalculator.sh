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
white_bg="\e[0;47m${expand_bg}"
green="\e[0;92m"
yellow="\e[0;33m"
black="\e[0;30m"
purple="\e[0;35m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

workingNum=0
EXIT=0


# Purpose: Print Menu to screen and prompt user to select arithmetic operand.

clear

echo -e "${uline}${bold} Bash Calculator ${reset}"
echo ""
echo "Please enter your first number, followed by your operand of choice and then your second number. For example 10 - 3"
#add this functionality
#echo "If you have already performed a calculation, you can use the previous ans as either the first or second number by typing ans"
echo "Alternatively type C and enter to clear the working space or Q and enter to quit the program"
echo ""
echo -e "${blue}(+) Addition${reset}"
echo -e "${green}(-) Subtraction${reset}"
echo -e "${red}(x) Multiplication${reset}"
echo -e "${purple}(/) Division${reset}"
echo -e "${yellow}(C) Clear${reset}"
echo -e "${bold}(Q) QUIT ${reset}"
echo ""



# Purpose: While loop - run script until user decides to quit.

while [ "$EXIT" -eq 0 ]
do

# Purpose: Prompt user to type mathematical expression using two numbers and either the +, -, x or / operand.

read -p '' firstNum operandVarSymbol secondNum
echo "firstNum check: $firstNum"
echo "operandVarSymbol check: $operandVarSymbol"
echo "secondNum check: $secondNum"

if [ $firstNum != "Q" ]; then
    case $operandVarSymbol in
    +)
    workingNum=$(expr "$firstNum" + "$secondNum")
    echo -e " = $workingNum"
    ;;
    -)
    workingNum=$(expr "$firstNum" - "$secondNum")
    echo -e " = $workingNum"
    ;;
    x)
    workingNum=$(expr "$firstNum" x "$secondNum")
    echo -e " = $workingNum"
    ;;
    /)
    workingNum=$(expr "$firstNum" / "$secondNum")
    echo -e " = $workingNum"
    ;;
    #Default Case
    *)
    echo ""
    echo -e "${red}${bold}ERROR: Invalid entry!${reset}"
    ;;
    esac
elif [ $firstNum = "C" ]; then
    clear
    echo -e "${uline}${bold} Bash Calculator ${reset}"
    echo ""
    echo "Please enter your first number, followed by your operand of choice and then your second number. For example 10 - 3"
    echo "Alternatively type C and enter to clear the working space or Q and enter to quit the program"
    echo ""
    echo -e "${blue}(+) Addition${reset}"
    echo -e "${green}(-) Subtraction${reset}"
    echo -e "${red}(x) Multiplication${reset}"
    echo -e "${purple}(/) Division${reset}"
    echo -e "${yellow}(C) Clear${reset}"
    echo -e "${bold}(Q) QUIT ${reset}"
    echo ""
    firstNum=0
    secondNum=0
    operandVarSymbol=?
elif [ $firstNum = "Q" ]; then
    echo "Program quit successfully"
    EXIT=1
else   
    echo ""
    echo -e "${red}${bold}ERROR: UNKNOWN ERROR!${reset}"
fi


done

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. 17 January 2022. 3.2 Use arithmetic expressions to do calculations in scripts. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274255_1
# Antonio (GameTheory). 3 October 2019. BASH tips and snippets. techStop. https://techstop.github.io/bash-script-colors/
# Linuxize. 24 February 2020. Bash While Loop. Linuxize. https://linuxize.com/post/bash-while-loop/

