#!/bin/bash 

### Special Variables in Linux are : $0 to $n , $* , $@ , $# , $$ 

echo $0   # Prints the script name that you're running
echo $1   # First argument from the command line
echo $2   # Second argument from the command line

echo $*   # Gives you all the arguments used in the script
echo $@   # Gives you all the arguments used in the script
echo $#   # Gves you the number of arguments users
echo $$   # Gives you the PID of the current process
echo $?   # Gives you the exit code the previous command

# On command you can supply 9 variables 
# Ex  
# sh abc.sh 10 20 30 40