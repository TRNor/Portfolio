#!/bin/bash
read -p 'Type the name of the folder you would like to create: ' folderName
mkdir "$folderName"
read -p 'where would you like to put your folder? ' folderLocation
mv "$folderName" $folderLocation
exit 0
