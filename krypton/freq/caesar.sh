#!/bin/bash

STRING=$(cat)
for i in {1..25}; do
	echo $i $STRING | tr $(printf %${i}s | tr ' ' '.')A-Z A-ZA-Z
done
