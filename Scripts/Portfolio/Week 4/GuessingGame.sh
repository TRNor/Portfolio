#!/bin/bash
# GuessingGame.sh - A script that uses the getNumber() function in a number guessing game with the following rules:
    # The user should be asked to enter a number between 1 and 100.
    # If the number is 42, the game should print 'Correct!'.
    # If the number is less than 42, the game should print 'Too Low!'
    # If the number is greater than 42, the game should print 'Too High!'
    # The game should repeat until the user has found the correct number
# Author: Thomas Norman
# Date Modified: 7 February 2022
# ------------------------------------------------------------------------------------------

# Purpose: Function - Prints an error

printError()    
{ 
    echo -e "\033[31mERROR:\033[0m $1" 
} 
      
# Purpose: Function - Gets a value between the 2nd and 3rd arguments 
      
getNumber()   
{ 
      
    read -p "$1: " guess
      
    while [ $guess -ne 42 ] 
    do 
        if [ $guess -lt 42 ] && [ $guess -ge 1 ]; then
            echo "Too Low!"
        elif [ $guess -gt 42 ] && [ $guess -le 100 ]; then
            echo "Too High!"
        else
            printError "Invalid Input, number entered outside acceptable range (1-100)"
        fi
         
        read -p "$1: " guess
    done 
} 

echo "Guessing Game"

getNumber "Please type a number between 1 and 100" 1 100 
      
echo "Well Done!" 

exit 0

# ------------------------------------------------------------------------------------------
# References
# 1. MCKNIGHT, R. 17 January 2022. 4.2 Understand and execute scripts that use multiple functions. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274263_1
# 2. MCKNIGHT, R. 17 January 2022. 4.3 Putting it together. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8304774_1
