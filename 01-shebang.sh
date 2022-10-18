#!/bin/bash 

echo Hello World

echo line1 
echo line2
echo line3

# Special Characters in linux for specific purpose.
# /n  : cursor moves to next 
# /t  : cursor moves to tab space 
# Whenever you want to use special characters, ensure you enbale them with -e option in echo

echo -e "LINE1\nLINE2\tLINE3"