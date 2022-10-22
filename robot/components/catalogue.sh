#!/bin/bash 
set -e 

COMPONENT=catalogue

source components/common.sh

echo -n "Installing Ngnix:"
yum install nginx -y &>> $LOGFILE
stat $?