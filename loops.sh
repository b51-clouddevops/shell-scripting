#!/bin/bash 

# Loops based on inputs. for loop is the option 
for games in cricket volleyball soccer coco chess; do  
    echo Game Name is ${games}
done 

# Loops based on conditions use while loop 
p=5 
while [ $p -gt 0 ] ; do 
    echo Run Number is $p 
    p=$p-1
done



