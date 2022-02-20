#!/bin/bash
# UserAccounts.sh - This script uses the AWK command to reformat user information from /etc/passwd into a neat table.
# Author: Thomas Norman
# Date Modified: 20-02-2022
# -----------------------------------------------------------------------------------------------------------------------

echo "Google Server IPs:" 
      
awk 'BEGIN { 
      
    FS=":"; 
      
    print "_________________________________"; 
      
    print "| \033[34mServer Type\033[0m | \033[34mIP             \033[0m |"; 
      
} 
      
{ 
      
    printf("| \033[33m%-11s\033[0m | \033[35m%-15s\033[0m |\n", $1, $2); 
      
} 
      
END { 
      
    print("|_____________|_________________|"); 
      
}' input.txt 
     