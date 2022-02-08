#!/bin/bash
# ip_info.sh - Gets IP addresses from the system the script is run on and prints them to screen after reformatting the ifconfig output.
# Author: Thomas Norman
# Date Modified: 8 February 2022
# ------------------------------------------------------------------------------------------
# Purpose: assign ifconfig output to variable 'netinfo'

netinfo="$(ifconfig)"


# Purpose: Use sed command to:
    # Not output anything except for lines that start with inet
    # Replace inet with IP Address:
    # Replace netmask with Subnet:
    # Replace broadcast with Broadcast Address:
    # Format the lines and indenting for easier readability using /n and /t to add new lines and tabs.
    # Ase p to print to screen the lines within the sed command.
    # Assign all of this to a variable IPaddresses for use in a script.
IPaddresses=$(echo "$netinfo" | sed -n '/inet / {
	s/inet/IP Address:/
	s/netmask/\n\t\tSubnet:/
    s/broadcast/\n\t\tBroadcast Address:/
    p
}')

# Tests the output of IPaddresses variable by printing to screen.

echo -e "The IP Addresses on this computer are:\n $IPaddresses"

# ------------------------------------------------------------------------------------------
# References
# 1. MCKNIGHT, R. 17 January 2022. 4.5 Write scripts that can parse text in a meaningful way. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274266_1
