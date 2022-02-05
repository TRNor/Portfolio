#!/bin/bash
# webDownloader.sh - A basic script that allows a user to download a URL contents to a folder of choice that loops until the user exits.
# Author: Thomas Norman
# Date Modified: 5 February 2022
# ------------------------------------------------------------------------------------------

# Purpose: Define Global Variables

bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

EXIT=0

# Purpose: While loop - run script until user decides to quit.

while [ "$EXIT" -eq 0 ]
do

# Purpose: Print Heading

echo -e "${uline}${bold} Web Downloader ${reset}"
echo ""

# Purpose: Prompt user to enter a URL to download from or type Q to quit.

read -p 'Please enter the URL you wish to download or type Q to quit: ' URLorQUIT

# Purpose: If the user enters Q, the program will quit, otherwise it will prompt the user to input a target directory assuming the user has input a valid URL to download from.

if [ "$URLorQUIT" != "Q" ]; then
    read -p 'Please enter the destination directory you wish to download to: ' directory

    # Purpose: use wget command to download contents of URL input by the user to the directory input by the user (Ref 2)

    wget -P "$directory" "$URLorQUIT"

    echo "File downloaded successfully!"

elif [ "$URLorQUIT" = "Q" ]; then

    # Purpose: User feedback that the program has quit.

    echo "Program quit successfully"
    EXIT=1

else   
    
    # Purpose: If the user enters an invalid input the program will print an error.

    echo ""
    echo -e "${red}${bold}ERROR: INVALID USER INPUT!${reset}"
fi

done

exit 0

# ------------------------------------------------------------------------------------------
# References
# 1. MCKNIGHT, R. 17 January 2022. 3.5 An internet downloader using loops. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274258_1
# 2. DOMANTAS G. 2 February 2022. Tutorials wget command examples. www.hostinger.com. https://www.hostinger.com/tutorials/wget-command-examples/

# ------------------------------------------------------------------------------------------
# Notes
# Script could be improved as it's not robust against invalid input such as an invalid URL.
