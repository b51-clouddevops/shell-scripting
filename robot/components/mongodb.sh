#!/bin/bash 
set -e 

# Verify the script is been executed as a root user or not.

COMPONENT=mongodb

source components/common.sh

echo -n "Configuring the repo:"
curl -s -o /etc/yum.repos.d/${COMPONENT}.repo https://raw.githubusercontent.com/stans-robot-project/${COMPONENT}/main/mongo.repo
stat $? 

echo -n "Installing ${COMPONENT}:"
yum install nginx -y &>> $LOGFILE
stat $?



# What I am planning to have ?
# 1) If any steps fails, I don't want to proceed further and want to break the script. 
# 2) I want validation to happen first and then if it's a root or sudo user,then only I want to run. If not, I'd like to break the script.
# 3) I would like to add Success / Failure messages next to each instruction.
