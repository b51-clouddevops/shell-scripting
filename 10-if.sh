#!/bin/bash 

a="abcd" 

if  [ "$a" == "abc" ]; then 
    echo -e "\e[32m Both of the are equal \e[0m"
else 
     echo -e "\e[31m Both of the are not equal \e[0m"
fi 


# Demo on not equals string operator
if  [ "$b" != "abc" ]; then 
     echo -e "\e[31m Both of the are not equal \e[0m"
fi 


if [ ]