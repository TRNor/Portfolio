#!/bin/bash
# ipAddressesOnly.sh - takes the input of ip_info.sh and filters the content to only print lines with IP addresses on them.
# Author: Thomas Norman
# Date Modified: 8 Februrary 2022
# ------------------------------------------------------------------------------------------

# Purpose: Assign output of ip_info.sh to a variable

ipInfoRaw=$(./ip_info.sh)

# Purpose: Use sed command and -n and p options to filter out all lines except those containing "IP Address"

echo "$ipInfoRaw" | sed -n '{
    /The IP Address/p
    s/IP Address: //p
}'

exit 0

# ------------------------------------------------------------------------------------------
# References
# 1. MCKNIGHT, R. 17 January 2022. 4.5 Write scripts that can parse text in a meaningful way. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274266_1
