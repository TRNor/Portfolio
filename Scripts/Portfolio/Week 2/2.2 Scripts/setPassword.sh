#!/bin/bash
# Step 1: Ask user to enter the name of the folder they want to create.
read -p 'Please enter a folder name: ' folderName
# Step 2: Make a new directory using the name input by the user.
mkdir "$folderName"
# Step 3: Ask the user to enter a password ensuring their input is hidden.
read -sp 'Please enter your password: ' password
# Step 4: Write the password input by the user to a file named secret.txt.
echo "$password" | sha256sum > secret.txt
#Step 5: Move secret.txt file into the user defined folder.
mv secret.txt $folderName
exit 0
