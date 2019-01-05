#!/bin/sh

# syntaks:
# sh sequence.sh [input number]
# Example:
# sh sequence.sh 100
# Outputs number sequence from 1 to 99

if [ $# -lt 1 ]
then
	echo 'Please input a number'
	exit 1
fi


count=1
while [ $count -lt $1 ]
do
	echo $count
	count=$(expr $count + 1)
done

