#!/bin/sh

inputfile=$1

while read -r line
do
	# display $line or do somthing with $line
	echo "$line" | sed 's/^/Hello /'
done < $inputfile
