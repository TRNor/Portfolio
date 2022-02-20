#!/bin/bash
# ip_info.sh - Gets IP addresses from the system the script is run on and prints them to screen after reformatting the ifconfig output.
# Author: Thomas Norman
# Date Modified: 20 February 2022
# ---------------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------------------------
# Assign ifconfig output to variable
#----------------------------------------------------------------------------------------------------------------------------
netinfo="$(ifconfig)"

#----------------------------------------------------------------------------------------------------------------------------
# On lines beginning with "inet ":
#   Replace "inet" with "IP Address:".
#   Replace "netmask" with "\n\t\tSubnet:".
#   Replace "broadcast" with "\n\t\tBroadcast Address:".
#   Format the lines and indenting for easier readability using /n and /t to add new lines and tabs.
#   Only print edited lines.
#   Assign output to variable IPaddresses.
#----------------------------------------------------------------------------------------------------------------------------
IPaddresses=$(echo "$netinfo" | sed -n '/inet / {
	s/inet/IP Address:/
	s/netmask/\n\t\tSubnet:/
    s/broadcast/\n\t\tBroadcast Address:/
    p
}')

#----------------------------------------------------------------------------------------------------------------------------
# Print contents of IPaddresses variable
#----------------------------------------------------------------------------------------------------------------------------
echo -e "The IP Addresses on this computer are:\n $IPaddresses"

exit 0

# ---------------------------------------------------------------------------------------------------------------------------
# References
# 1. 4.5 Write scripts that can parse text in a meaningful way. (2022). https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274266_1
