#!/bin/bash
# UserAccounts.sh - This script uses the AWK command to reformat user information from /etc/passwd into a neat table.
# Author: Thomas Norman
# Date Modified: 17-02-2022
# ------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------
# GET RAW DATA
#------------------------------------------------------------------------------------------------------------------------

#rawData=$("cat /etc/passwd")

#echo $rawData
#read -p "Press [Enter] key to start backup..."

#------------------------------------------------------------------------------------------------------------------------
# USE REGEX TO FILTER RAW DATA
#------------------------------------------------------------------------------------------------------------------------

#egrep -r "/bin/bash" /etc/passwd

#filteredData2=$(echo $filteredData | sed 's/\s/\n/g')

#echo $filteredData
#read -p "Press [Enter] key to start backup..."
#cat $filteredData2 | test.txt
#read -p "Press [Enter] key to start backup..."

#------------------------------------------------------------------------------------------------------------------------
# FORMAT DATA INTO TABLE
#------------------------------------------------------------------------------------------------------------------------
awk 'BEGIN{
    FS=":";


    print "_______________________________________________________________________________________________";
    print "| \033[34mUsername        \033[0m | \033[34mUser ID\033[0m | \033[34mGroup ID\033[0m | \033[34mHome                           \033[0m | \033[34mShell            \033[0m |";
    print "|__________________|_________|__________|_________________________________|___________________|";
}

/bash/{
    printf("| \033[32m%-16s\033[0m | \033[35m%-7s\033[0m | \033[35m%-8s\033[0m | \033[35m%-31s\033[0m | \033[35m%-17s\033[0m |\n", $1, $3, $4, $6, $7);
}

END {
    print "|__________________|_________|__________|_________________________________|___________________|";
}' /etc/passwd

exit 0

# ------------------------------------------------------------------------------------------
# References
# 1. MCKNIGHT, R. 17 January 2022. 5.5 Understand and execute scripts that use AWK. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274273_1