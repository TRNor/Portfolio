
#!/bin/bash
#Comparitor Operators:
#| Operator | Function                                           |
#| `-eq`    | is equal to if `[ "$a" -eq "$b" ]`                 |
#| `-ne`    | is not equal to if `[ "$a" -ne "$b" ]`             |
#| `-gt`    | is greater than if `[ "$a" -gt "$b" ]`             |
#| `-ge`    | is greater than or equal to if `[ "$a" -ge "$b" ]` |
#| `-lt`    | is less than if `[ "$a" -lt "$b" ]`                |
#| `-le`    | is less than or equal to if `[ "$a" -le "$b" ]`    |

#Ask user to input two integers to compare
read -p 'Please enter your first integer: ' int1
read -p 'Please enter your second integer: ' int2
echo "Your integers are $int1 and $int2"
#compare using -eq
echo "**Are they equal?**"
if [ "$int1" -eq "$int2" ]; then
	echo "Yes"
else
	echo "No"
fi

#compare using -ne
echo "**Are they not equal?**"
if [ "$int1" -ne "$int2" ]; then
	echo "Yes"
else
	echo "No"
fi

#compare using -gt
echo "**Is the first greater than the second?**"
if [ "$int1" -gt "$int2" ]; then
	echo "Yes"
else
	echo "No"
fi

#compare using -ge
echo "**Is the first greater or equal to the second?**"
if [ "$int1" -ge "$int2" ]; then
	echo "Yes"
else
	echo "No"
fi

#compare using -lt
echo "**Is the first less than the second?**"
if [ "$int1" -lt "$int2" ]; then
	echo "Yes"
else
	echo "No"
fi

#compare using -le
echo "**Is the first less than or equal to the second?**"
if [ "$int1" -le "$int2" ]; then
	echo "Yes"
else
	echo "No"
fi

exit 0
