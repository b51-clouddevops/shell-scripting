#!/bin/bash 
set -e 

COMPONENT=catalogue

source components/common.sh

echo -n "Configuring Node JS:"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash   &>> $LOGFILE

echo -n "Installing Nodejs: "
