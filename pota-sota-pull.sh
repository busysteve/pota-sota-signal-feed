#!/bin/bash

./sota-jq-calls.sh > sota-pull-old.txt
./pota-jq-calls.sh > pota-pull-old.txt

while [ 1 ];
do
	sleep 30
	./sota-jq-calls.sh > sota-pull-fresh.txt
	./pota-jq-calls.sh > pota-pull-fresh.txt
	diff sota-pull-old.txt sota-pull-fresh.txt | egrep "^>" | sed 's/\\\"//g' | sed 's/\"//g' | awk -F, '{printf( "%s  %s  %s/%s  %s\n", $2, $3, $4, $5, $6 )}'
	diff pota-pull-old.txt pota-pull-fresh.txt | egrep "^>" | sed 's/\\\"//g' | sed 's/\"//g' | awk -F, '{printf( "%s  %s  %s  %s\n", $2, $3, $4, $5 )}'
	#diff sota-pull-old.txt sota-pull-fresh.txt | egrep "^>" | sed 's/\\\"//g' | sed 's/\"//g' 
	#diff sota-pull-old.txt sota-pull-fresh.txt | egrep "^>" 
	mv sota-pull-fresh.txt sota-pull-old.txt
	mv pota-pull-fresh.txt pota-pull-old.txt
done;
