#!/bin/bash 

a="abcd" 

if  [ "$a" == "abc" ]; then 
    echo -e "\e[32m Both of the are equal \e[0m"
    exit 0
else 
     echo -e "\e[31m Both of the are not equal \e[0m"
     exit 1
fi 



if  [ "$a" != "abc" ]; then 
     echo -e "\e[31m Both of the are not equal \e[0m"
     exit 1
fi 