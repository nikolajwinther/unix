#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Syntax:"
    echo "./createDeleteThisList.sh [inputfile]"
    echo "Example:"
    echo "./createDeleteThisList.sh /home/niw/datawell-convert/trunk/js/GaleToXml.use.js"
    exit 1
fi

