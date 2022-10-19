#!/bin/bash 

# case $var in 

#     opt1) commands ;; 
#     opt2) commands ;; 

# esac 

ACTION=$1

case $ACTION in 

    start) 
        echo "Startring XYZ Service" 
        ;; 
    stop)
        echo "Stopping XYZ Service"
        ;;
    *) 
        echo -e "\e[31m Valid Options are either start or stop \e[0m"

esac 