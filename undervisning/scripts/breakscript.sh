#!/bin/bash

if [ $# -lt 0 ]
then
    echo "Syntax:"
    echo "breakscript.sh"
    echo "Example:"
    echo "./breakscript.sh"
    exit 1
fi

for i in $(echo {a..c})
do
	echo $i
	for j in $(seq 3)
	do
		echo $i$j
		if [ $j -eq 2 ]
		then
			echo break
			break
		fi
		echo hello1
	done
	echo hello2
done
