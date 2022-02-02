#!/bin/bash
# snippetTest.sh - A sandbox script to test snippets.
# Author: Thomas Norman
# Date Modified: 2022, Februaary
# ------------------------------------------------------------------------------------------
# Purpose: Test 'prompt user' snippet

read -p 'This is a test, Please type "Yes": ' userInput

# Purpose: Test 'case' snippet
case $userInput in

Yes)
echo "Well done you completed the test successfully!"
;;

*)
echo "Sorry, you didn't pass the test."
;;

esac

exit 0

# Purpose: Test 'references' snippet
# ------------------------------------------------------------------------------------------
# References
# MCKNIGHT, R. 17 January 2022. 3.1 Create a snippet in Visual Studio Code and use in the script writing process. Blackboard.Ecu.Edu.Au. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274254_1&mode=view