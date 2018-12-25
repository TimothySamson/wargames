#!/bin/python

import fileinput 
import sys

action = sys.argv.pop() # 1 for decrypt
keys = sys.argv.pop()

keyList = [-ord(x) + 65 if action == "1" else ord(x) - 65 for x in keys]
print(keyList)
for line in fileinput.input():
    x = ""
    for i in range(len(line) - 1):
        if line[i] == " ":
            x += " "
            continue
        val = (ord(line[i]) + keyList[i % len(keyList)] - 65) % 26

        if val < 0:
            val += 26

        val += 65
        x += chr(val)
    print(x)

