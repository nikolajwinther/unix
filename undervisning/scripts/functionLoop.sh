#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Syntax:"
    echo "./mathProblem.sh [bottom number] [top number]"
    echo "Example:"
    echo "./mathProblem.sh 100 120"
    exit 1
fi

function checkDivisor() {
	if [ $(expr $1 % $2) -eq 0 ]
        then
        	divisors="$divisors $2"
        fi
}

start=$1
end=$2
numbers1=$(seq -w $start $end)
for i in $numbers1
do
	checkNumbers=$(expr $i / 2)
	numbers2=$(seq -w $checkNumbers)
	divisors=""
	for j in $numbers2
	do
		checkDivisor $i $j
	done
	sum=0
	for k in $divisors
	do
		sum=$(expr $sum + $k)
	done
	checkDivisor $i $i
	echo Nummer: $i, Antal: $(echo $divisors | wc -w), Sumtal: $sum, Divisorer: $divisors
	if [ $i -eq $sum ]
	then
		echo $i er fuldkomment

	fi
done
