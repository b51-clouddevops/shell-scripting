#!/bin/bash 

# case $var in 

#     opt1) commands ;; 
#     opt2) commands ;; 

# esac 

ACTION=$1

case $ACTION in 

    start) 
        echo "Startring XYZ Service" 
        exit 0
        ;; 
    stop)
        echo "Stopping XYZ Service"
        exit 1
        ;;
    *) 
        echo -e "\e[31m Valid Options are either start or stop \e[0m"
        exit 2
esac 