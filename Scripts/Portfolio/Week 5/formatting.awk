# formatting.awk - This awk script can be called to format the input data into a neat table.
# Author: Thomas Norman
# Date Modified: 20-02-2022
# ---------------------------------------------------------------------------------------------------------------------------

BEGIN{
    #------------------------------------------------------------------------------------------------------------------------
    # Define Field Seperator, Print column headings and corresponding table boarders
    #------------------------------------------------------------------------------------------------------------------------
    FS=":";

    print "_______________________________________________________________________________________________";
    print "| \033[34mUsername        \033[0m | \033[34mUser ID\033[0m | \033[34mGroup ID\033[0m | \033[34mHome                           \033[0m | \033[34mShell            \033[0m |";
    print "|__________________|_________|__________|_________________________________|___________________|";
}
    #------------------------------------------------------------------------------------------------------------------------
    # Filter to print only lines that contain "bash"
    # Format table with colours and spacing for selected fields.
    #------------------------------------------------------------------------------------------------------------------------
/bash/{
    printf("| \033[32m%-16s\033[0m | \033[35m%-7s\033[0m | \033[35m%-8s\033[0m | \033[35m%-31s\033[0m | \033[35m%-17s\033[0m |\n", $1, $3, $4, $6, $7);
}
    
END {
    #------------------------------------------------------------------------------------------------------------------------
    # Print base boarder of table
    #------------------------------------------------------------------------------------------------------------------------
    print "|__________________|_________|__________|_________________________________|___________________|";
}

# ---------------------------------------------------------------------------------------------------------------------------
# References
# 1. 5.5 Understand and execute scripts that use AWK. (2022). https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274273_1