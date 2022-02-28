#!/usr/bin/python3 
# BruteForce.py - This python script uses itertools to iterate through every combination of lowercase 
#                 letters [a-z], uppercase letters [A-Z] and digits from [0-9] in a range up to 10 characters 
#                 long to brute force crack the password hashed in secretPWHash. The hash of each guess is 
#                 compared with the known hash of the secret password.
# Author: Thomas Norman
# Date Modified: 28-02-2022
# -----------------------------------------------------------------------------------------------------------------------

import hashlib 
import itertools
import string
from colorama import Fore, Back, Style

#------------------------------------------------------------------------------------------------------------------------
# PASSWORD GUESS FUNCTION
#------------------------------------------------------------------------------------------------------------------------
def guess_password(real, disp):
    # Define characters to be checked
    chars = string.ascii_lowercase + string.ascii_uppercase + string.digits
    attempts = 0
    print(Fore.YELLOW + "\nWORKING...")
    # Iterate through every possible combo of chars, repeating up to a maximum string of 9 chars long.
    for password_length in range(1, 10):
        for guess in itertools.product(chars, repeat=password_length):
            attempts += 1
            guess = ''.join(guess)
            # Hash the current guess
            hashguess = hashlib.sha256(guess.encode("utf-8")).hexdigest() 
            # If hashed guess equals hashed secret PW, print pw & number of attempts.
            if hashguess == real:
                return 'Your Secret Password is {}. It was cracked in {} guesses.'.format(guess, attempts)
            # uncomment line 18 to display attempts, though will be slower
            if disp == "Y":
                print(Fore.YELLOW + guess, attempts)

#------------------------------------------------------------------------------------------------------------------------
# MAIN CODE
#------------------------------------------------------------------------------------------------------------------------

done = False
while not done:
    print(Fore.WHITE + "--------------------------------------")
    print("|" + Fore.MAGENTA + "   BRUTEFORCE.PY PASSWORD CRACKER   " + Fore.WHITE + "|")
    print(Fore.WHITE + "--------------------------------------")
    print(Fore.WHITE + "C - Crack")
    print("Q - Quit")
    print(Fore.WHITE + "--------------------------------------")
    choice = input(":: ")
    if choice == "C":
        print(Fore.CYAN + "Please enter a password consisting of only upper or lowercase letters [A-Za-z] and or numbers from [0-9].")
        print(Fore.CYAN + "Your password must be no longer than 10 characters long.")
        print(Fore.CYAN + "NOTE: Combinations longer than 4 characters could take a fairly long time to crack.\n")

        display = input(Fore.LIGHTGREEN_EX + "To print guesses in real time type 'Y' and press [ENTER], otherwise press [ENTER].")
        secretPW = input(Fore.GREEN + "\nYour Secret Password: ")
        secretPWHash = hashlib.sha256(secretPW.encode("utf-8")).hexdigest() 

        print("\n" + Fore.RED + guess_password(secretPWHash, display))
    elif choice == "Q":
        print("Program Quit Successfully!")
        done = True
    else:
        print(Fore.RED + "ERROR: Invalid User Input")



# -----------------------------------------------------------------------------------------------------------------------
# References
# 1. MCKNIGHT, R. 6.6 UWrite scripts in other languages for other platforms. (2022). Edith Cowan University Blackboard. https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274281_1&mode=view
# 2. Kramer, C. (2016). stackoverflow.com. https://stackoverflow.com/questions/40269605/how-to-create-a-brute-force-password-cracker-for-alphabetical-and-alphanumerical