#!/bin/bash

echo
echo "**NOTE: This scrip should run within the folder contains the log files you are checking!**"


if [[ $1 =~ ^[[:digit:]]{4}$ ]]; then
	echo

else
	echo "Error, Ensure you use correct format  MMDD HH:MM:SS AM|PM, Try again!"
	echo
exit 1
fi


if [[ $2 =~ ^(([0-1]?[0-2])):([0-5]?[0-9]):(([0-5]?[0-9]))?$ ]]; then
	echo
	echo
else
	echo "Error, Ensure you use correct format MMDD HH:MM:SS AM|PM  , Try again!"
	echo
exit 2
fi

if [[ $3 =~ ^(AM|PM) ]]; then

	echo
else

	echo "Error, Ensure you use correct format MMDD HH:MM:SS AM|PM, Try again!"
	echo
exit 3
fi

sed -n 1p $1_Dealer_schedule
cat $1_Dealer_schedule | grep "$2 $3" | awk -F" " '{print $1, $2, $3, $4, $5, $6, $7, $8}'

echo
echo
