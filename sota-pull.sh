#!/bin/bash

./sota-jq-calls.sh > sota-pull-old.txt

while [ 1 ];
do
	sleep 60
	./sota-jq-calls.sh > sota-pull-fresh.txt
	diff sota-pull-old.txt sota-pull-fresh.txt | egrep "^>" | sed 's/\\\"//g' | sed 's/\"//g' | awk -F, '{printf( "%s  %s  %s/%s\n", $2, $3, $4, $5 )}'
	#diff sota-pull-old.txt sota-pull-fresh.txt | egrep "^>" | sed 's/\\\"//g' | sed 's/\"//g' 
	#diff sota-pull-old.txt sota-pull-fresh.txt | egrep "^>" 
	mv sota-pull-fresh.txt sota-pull-old.txt
done;
