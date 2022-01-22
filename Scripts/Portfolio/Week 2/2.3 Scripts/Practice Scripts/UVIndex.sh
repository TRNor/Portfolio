#!/bin/bash

#Ask user to input the UV index.
read -p 'Please enter a UV index value from 0 to 11: ' UVIndex

if [ "$UVIndex" -le 2 ]; then
	echo "Minimal protection required."
elif [[ "$UVIndex" -ge 3 ]] && [[ "$UVIndex" -le 7 ]]; then
	echo "Standard protection required."
elif [[ "$UVIndex" -ge 8 ]] && [[ "$UVIndex" -le 11 ]]; then
	echo "Full protective measures required."
else
	echo "Invalid input"
fi
exit 0
