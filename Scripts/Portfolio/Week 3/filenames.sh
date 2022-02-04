#!/bin/bash
# filenames.sh - A simple script that can iterate through a list of file names in a text file and output if the file name exists, is a directory or doesnt know what it is.
# Author: Thomas Norman
# Date Modified: 4 February 2022
# ------------------------------------------------------------------------------------------

# Purpose: Define Global Variables

red="\e[0;91m"
blue="\e[0;94m"
green="\e[0;92m"
reset="\e[0m"

# Purpose: assign filepath to var "filePath"

filePath=/home/student/ThomasNorman/Scripts/Portfolio/Week\ 3/filenames.txt

# Purpose: count number of lines in .txt file to itterate through.
lineCount=$(wc --lines < $filePath)

echo $lineCount


for (( i = 0; i <= $lineCount; i++))
do

if [ "$lineCount" != "Q" ] && [ "$firstNum" != "C" ]; then
    case $operandVarSymbol in
    +)
    ansNum=$(expr "$firstNum" + "$secondNum")
    echo -e " = $ansNum"
    ;;
    -)
    ansNum=$(expr "$firstNum" - "$secondNum")
    echo -e " = $ansNum"
    ;;
    x)
    ansNum=$(expr "$firstNum" \* "$secondNum")
    echo -e " = $ansNum"
    ;;
    /)
    ansNum=$(expr "$firstNum" / "$secondNum")
    echo -e " = $ansNum"
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
    operandVarSymbol="?"
elif [ $firstNum = "Q" ]; then
    echo "Program quit successfully"
    EXIT=1
else   
    echo ""
    echo -e "${red}${bold}ERROR: UNKNOWN ERROR!${reset}"
fi

done

exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. 17 January 2022. 3.2 Use arithmetic expressions to do calculations in scripts. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274255_1
# Antonio (GameTheory). 3 October 2019. BASH tips and snippets. techStop. https://techstop.github.io/bash-script-colors/
# YASIN, A.. November 2021. count the number of lines in a file in bash. linuxhint. https://linuxhint.com/count-the-number-of-lines-in-a-file-in-bash/

