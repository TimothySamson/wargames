#!/bin/bash

function mostOccuring {
	printf $1 | sed "s/../&\n/g" | sort | uniq -c | sort -n| tail -n 4 | awk '{print $2}'

}

function decode {
	possibleKeys=( $(mostOccuring $1) )
	for key in "${possibleKeys[@]}"; do
		for i in {e,t,a,o,i,n}; do
			./xorDecode $1 $key $i
		done

		./xorDecode $1 $key ' '
	done
}

while read line; do
	decode $line | sort | uniq -c | sort -n | tail -n 3
done 
