#!/bin/bash
# UserAccounts.sh - This script uses the AWK command to reformat user information from /etc/passwd into a neat table.
# Author: Thomas Norman
# Date Modified: 20-02-2022
# -----------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------
# Call formatting.awk file to process raw data in /etc/passwd into a neat table
#------------------------------------------------------------------------------------------------------------------------
awk -f formatting.awk /etc/passwd

exit 0

# -----------------------------------------------------------------------------------------------------------------------
# References
# 1. 5.5 Understand and execute scripts that use AWK. (2022). https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274273_1