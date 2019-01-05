#!/bin/bash
# Example of an if-else-condition

if [ $# -lt 1 ]
then
    echo "Syntax:"
    echo "./ifElseLoop.sh [name]"
    echo "Example:"
    echo "./ifElseLoop.sh Jimmy"
    exit 1
fi

name=$1


if [ $name = "Jimmy" ]
then
	echo "Hello $name, where there problems on the road today?"
elif [ $name = "Susanne" ]
then
	echo "Hello $name, was your train delayed again?"
else
	echo Hello "someone else"
fi

