#!/bin/sh

# Colors are of 2 types `FOREGROUND` & `BACKGROUND` Color.
# Colors       Foreground          Background

# Red               31                  41
# Green             32                  42
# Yellow            33                  43
# Blue              34                  44
# Magenta           35                  45
# Cyan              36                  46
# ```

# Syntax : echo -e "\e[COLORCODEm  Your Text \e[0m"
# Syntax for backGround  
# echo -e "\e[COLORCODEm  Your Text \e[0m"

echo -e "\e[33m I am printing Yellow \e[0m"
echo -e "\e[43;31m I am printing Red \e[0m"
echo -e "\e[32m I am printing Green \e[0m"
echo -e "\e[34m I am printing Blue \e[0m"
echo -e "\e[35m I am printing Magnet \e[0m"
echo -e "\e[36m I am printing Cyan \e[0m"

