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



# Purpose: count number of lines in .txt file to itterate through.
#lineCountRaw=$(wc -l filenames.txt)
#lineCount=$($lineCountRaw | cut -d' ' -f1)
#echo "$lineCount"

# Purpose: write each line of the .txt file to an array using the mapfile function.

mapfile -t lineArray < <(cut -d' ' -f1 < filenames.txt)

# Purpose: For each line (array element) compare to various conditions and output result.

for ((i = 0; i <= 10; i++))
do
echo ${lineArray[$i]}
done




exit 0

# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. 17 January 2022. 3.2 Use arithmetic expressions to do calculations in scripts. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274255_1
# Antonio (GameTheory). 3 October 2019. BASH tips and snippets. techStop. https://techstop.github.io/bash-script-colors/
# YASIN, A. November 2021. count the number of lines in a file in bash. linuxhint. https://linuxhint.com/count-the-number-of-lines-in-a-file-in-bash/
# CYRUS. 12 October 2019. read lines from a text file and store it in array. stackoverflow. https://stackoverflow.com/questions/58352217/read-lines-from-text-file-and-store-it-in-array


