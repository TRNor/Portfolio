#!/bin/bash
# filenames.sh - A simple script that can iterate through a list of file names in a text file and output if the file name exists, is a directory or doesnt know what it is.
# Author: Thomas Norman
# Date Modified: 4 February 2022
# ------------------------------------------------------------------------------------------

# Purpose: count number of lines in .txt file to itterate through later on in the script (Ref 5).

lineCount=$(wc -l < filenames.txt)

# Purpose: Write each line of the filenames.txt file to an array using the mapfile function (Ref 4 and 5).

mapfile -t lineArray < <(cut -d' ' -f1 < filenames.txt)

# Purpose: For each line (array element) compare to various conditions using if/else statement and print results.

for ((i = 0; i <= $lineCount; i++))
do

# Purpose: If the elements of the array (lines of text) contain ".sh" print "That file exists" (Ref 6).
 
if [[ "${lineArray[$i]}" == *".sh" ]]; then
    echo "${lineArray[$i]} - That file exists"

# Purpose: Else if the elements of the array (lines of text) are a valid directory, print "That's a directory" (Ref 7)

elif [ -d "${lineArray[$i]}" ]; then
    echo "${lineArray[$i]} - That's a directory"

# Purpose: Else if the element is a null (aka no text on that line), don't print anything. (Ref 8)

elif [ -z "${lineArray[$i]}" ]; then
    :

else
    echo "I don't know what that is."
fi


done




exit 0

# ------------------------------------------------------------------------------------------
# References
# 1. MCKNIGHT, R. 17 January 2022. 3.2 Use arithmetic expressions to do calculations in scripts. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274255_1
# 2. ANTONIO. (GameTheory). 3 October 2019. BASH tips and snippets. techStop. https://techstop.github.io/bash-script-colors/
# 3. YASIN, A. November 2021. count the number of lines in a file in bash. linuxhint. https://linuxhint.com/count-the-number-of-lines-in-a-file-in-bash/
# 4. CYRUS. 12 October 2019. read lines from a text file and store it in array. stackoverflow. https://stackoverflow.com/questions/58352217/read-lines-from-text-file-and-store-it-in-array
# 5. MORTON, B. 2 November 2021. Bash Split String. linuxscrew. https://www.linuxscrew.com/bash-split-string
# 6. BELLAIRE, A. 23 October 2008. how to check if a string contains a substring. stackoverflow. https://stackoverflow.com/questions/229551/how-to-check-if-a-string-contains-a-substring-in-bash
# 7. vgersh99. 14 November 2011. bash shell check if value valid directory. www.unix.com. https://www.unix.com/homework-and-coursework-questions/171225-bash-shell-check-if-value-valid-directory.html
# 8. GITE, V. 1 June 2021. bash shell find out if a variable has null value or not. www.cyberciti.biz. https://www.cyberciti.biz/faq/bash-shell-find-out-if-a-variable-has-null-value-or-not/

