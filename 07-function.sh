#!/bin/bash

# Declaring a function 

sample() {
    echo "I am msg from function named sample"
}


#Calling function sample
sample

stat() {
    echo "Load Average on the system is $(uptime | awk -F : '{print $NF}' | awk -F , '{print $1}')"
    echo "Number of logged in sessions is : $(who  |wc -l)"
    echo "Function stat is completed"
    echo " . . . . Calling sample function . . . . ."
    sample
}

#calling stat function
stat 