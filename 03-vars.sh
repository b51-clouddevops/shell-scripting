#!/bin/bash

# Variable is something which holds the values dynamically.

a=10 
b=20 
# c=1000   # local variables

# No concept of data types in shell-scripting.
# Everything is considered sa string by default.

echo $a 
echo ${a} 
echo "$a"
echo "${b}"
echo '${a}'

echo "prining the value of c : $c"

# Whenever you use single quotes on variable, the power of special characters will be taken down.
# Here $ is a special character to print variables.

# rm -rf /data/${OPT_VARIABLE}  # rm -rf /data/


# Note: local variables will have higher priority than export variables ( environment variables )