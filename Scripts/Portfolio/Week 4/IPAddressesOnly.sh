#!/bin/bash
# ipAddressesOnly.sh - Takes the input of ip_info.sh and filters the content to only print lines with IP addresses on them.
# Author: Thomas Norman
# Date Modified: 20 Februrary 2022
# ---------------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------------------------
# Read output of ip_info.sh into a variable.
#----------------------------------------------------------------------------------------------------------------------------
ipInfoRaw=$(./ip_info.sh)

#----------------------------------------------------------------------------------------------------------------------------
# Print IP Addresses on this computer.
#----------------------------------------------------------------------------------------------------------------------------
echo "$ipInfoRaw" | sed -n '{
    /The IP Address/p
    s/IP Address: //p
}'

exit 0

# ----------------------------------------------------------------------------------------------------------------------------
# References
# 1. 4.5 Write scripts that can parse text in a meaningful way. (2022). https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274266_1
