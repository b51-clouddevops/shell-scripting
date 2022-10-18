#!/bin/bash

# Variable is something which holds the values dynamically.

a=10 
b=20 

# No concept of data types in shell-scripting.
# Everything is considered sa string by default

echo $a 
echo ${a} 
echo "$a"
echo "${b}"

# Whenever you use single quotes on variable, the power of spec