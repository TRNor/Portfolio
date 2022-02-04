#!/bin/bash
# fruitLoop.sh - A looping script that prints a list of fruit to the screen.
# Author: Thomas Norman
# Date Modified: 4 February 2022
# ------------------------------------------------------------------------------------------
      
# Assign list of fruit into the array
      
fruit=(Apple Mango Strawberry Orange Banana)
      
# For loop prints each element of the fruit array.
      
for ((i = 0; i <= 4; i++)) 
      
do 
      
    #Print fruit at array location i
      
    echo "FRUIT: ${fruit[i]}"

done 
     
exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. 17 January 2022. 3.3 Using loops for repetition. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274256_1
# ALKABARY, A. 24 January 2022. Bash Arrays. linuxhandbook. https://linuxhandbook.com/bash-arrays/

