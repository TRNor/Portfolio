#!/bin/bash
# megafoldermaker.sh - A looping script that an create multiple folders at once.
# Author: Thomas Norman
# Date Modified: 4 February 2022
# ------------------------------------------------------------------------------------------
      
#If there aren't two arguments to the script 
      
if (( $#!=2 )); then 
      
    #Print an error and exit 
      
    echo "Error, provide two numbers" && exit 1 
      
fi 
      
#For every number between the first argument and the last 
      
for ((i = $1; i <= $2; i++)) 
      
do 
      
    #Create a new folder for that number 
      
    echo "Creating directory number $i" 
      
    mkdir "Week $i" 
      
done 
     
exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. 17 January 2022. 3.3 Using loops for repetition. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274256_1