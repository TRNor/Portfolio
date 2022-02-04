#!/bin/bash
# webDownloader.sh - A basic script that allows a user to download a URL contents to a folder of choice that loops until the user exits.
# Author: Thomas Norman
# Date Modified: 4 February 2022
# ------------------------------------------------------------------------------------------




# Purpose: Prompt the user to enter the URL of the file they wish to download.

read -p 'Please enter the URL you wish to download: ' URL

# Purpose: Prompt the user to enter the directory for where they wish to download the file to.

read -p 'Please enter the destination directory you wish to download to: ' directory

# Purpose: use wget command to download contents of URL input by the user to the directory input by the user (Ref 2)

wget -P "$directory" "$URL"


# ------------------------------------------------------------------------------------------
# References
# 1. MCKNIGHT, R. 17 January 2022. 3.5 An internet downloader using loops. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274258_1
# 2. DOMANTAS G. 2 February 2022. Tutorials wget command examples. www.hostinger.com. https://www.hostinger.com/tutorials/wget-command-examples/


