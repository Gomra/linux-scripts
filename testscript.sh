#!/bin/bash
fehler=0

if [ ! -f ~/test.txt ]; then
	echo "test file does not exist"
	echo "put file into homedir"
	fehler=1
fi

echo "hallo\n zweile" >> ~/test.txt
if [ $fehler -ne 0 ]; then
	exit 1
fi


exit 0