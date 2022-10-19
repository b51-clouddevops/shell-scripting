#!/bin/bash 

# case $var in 

#     opt1) commands ;; 
#     opt2) commands ;; 

# esac 



case $1 in 

    start) 
        echo "Startring XYZ Service" 
        ;; 
    stop)
        echo "Stopping XYZ Service"
        ;;
    *) 
        echo "Valip Options are either start or stop"

esac 