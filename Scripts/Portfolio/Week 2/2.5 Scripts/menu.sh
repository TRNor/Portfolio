#!/bin/bash

#Run passwordCheck script
( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/2.4 Scripts/passwordCheck.sh" )

if [[ $? -eq 0 ]]; then
    clear
    echo "1. Create a folder"
    echo "2. Copy a folder"
    echo "3. Set a password"
else
    echo "The password you entered was incorrect"
fi

#Read users input

read userSelection

#Run appropriate script based on users selection

if [[ $userSelection -eq 1 ]]; then
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/2.1 Scripts/foldermaker.sh" )
elif [[ $userSelection -eq 2 ]]; then
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/2.3 Scripts/foldercopier.sh" )
elif [[ $userSelection -eq 3 ]];then
    ( "/home/student/ThomasNorman/Scripts/Portfolio/Week 2/2.5 Scripts/resetPassword.sh" )
else
    echo "You entered an invalid option."
fi

exit 0
