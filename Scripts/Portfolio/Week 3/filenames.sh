#!/bin/bash
# filenames.sh - A simple script that can iterate through a list of file names in a text file and output if the file name exists, is a directory or doesnt know what it is.
# Author: Thomas Norman
# Date Modified: 5 February 2022
# ------------------------------------------------------------------------------------------

# Purpose: Write each line of the filenames.txt file to an array using the mapfile function (Ref 4).

mapfile -t lineArray < filenames.txt

# Purpose: For each line (array element) compare to various conditions using if/else statement and file operators. (Ref 5)

for i in ${lineArray[@]};
do

    if [ -f $i ]; then
        echo "$i - That file exists"
    elif [ -d $i ]; then
        echo "$i - That's a directory"
    elif [ -z $i ]; then
        :
    else
        echo "$i - I don't know what that is."
    fi

done

exit 0

# ------------------------------------------------------------------------------------------
# References
# 1. MCKNIGHT, R. 17 January 2022. 3.4 Write for loop statements to control program flow. Blackboard.Ecu.Edu.Au. hhttps://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274257_1
# 2. ANTONIO. (GameTheory). 3 October 2019. BASH tips and snippets. techStop. https://techstop.github.io/bash-script-colors/
# 3. YASIN, A. November 2021. count the number of lines in a file in bash. linuxhint. https://linuxhint.com/count-the-number-of-lines-in-a-file-in-bash/
# 4. CYRUS. 12 October 2019. read lines from a text file and store it in array. stackoverflow. https://stackoverflow.com/questions/58352217/read-lines-from-text-file-and-store-it-in-array
# 5. COMPUTERHOPE. 1 February 2021. Bash test builtin command. computerhope. https://www.computerhope.com/unix/bash/test.htm
