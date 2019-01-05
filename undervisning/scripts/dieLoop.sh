#!/bin/sh

if [ $# -lt 1 ]
#if [ -z $1 ]
#if [ x$1 = "x" ]
then
	echo 'Please input a number'
	exit 1
fi

for i in $(seq $1)
do
	echo Punkt $i.
done

