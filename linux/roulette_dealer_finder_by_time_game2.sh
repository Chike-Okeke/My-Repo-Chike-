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

if [[ $4 =~ ^(BlackJack|Roulette|Texas_Hold_EM) ]]; then

        echo
else

        echo "Error, The Game name should be (BlackJack or Roulette or Texas_Hold_EM) Only!!, Try again"
        echo
exit 4
fi


#sed -n 1p $1_Dealer_schedule

cat $1_Dealer_schedule | awk -vcol1="Hour" -vcol2="AM/PM" -vcol3="$4_Dealer_FNAME" 'NR==1{for(i=1;i<=NF;i++){if($i==col1)c1=i; if ($i==col2)c2=i; if ($i==col3)c3=i}} NR>0{print $c1 " " $c2 " " $c3}'



echo
echo
