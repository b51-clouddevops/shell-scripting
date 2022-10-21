#!/bin/bash 
set -e 

# Verify the script is been executed as a root user or not.

COMPONENT=mongodb

source components/common.sh

echo -n "Configuring the repo:"
curl -s -o /etc/yum.repos.d/${COMPONENT}.repo https://raw.githubusercontent.com/stans-robot-project/${COMPONENT}/main/mongo.repo
stat $? 

echo -n "Installing ${COMPONENT}:"
yum install mongodb-org -y &>> $LOGFILE
stat $?

echo -n "Updating the mongodb config:"
sed -i -e 's/127.0.0.1/0.0.0.0/' mongod.conf 
stat $? 

echo -n "Strating MongoDB: "
systemctl enable mongodb &>> $LOGFILE
systemctl start mongodb &>> $LOGFILE

echo -n "Downloading the $COMPONENT Schema:"
curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip" 
stat $? 

echo -n ""

# curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"

# cd /tmp
# unzip mongodb.zip
# cd mongodb-main
# mongo < catalogue.js
# mongo < users.js

# What I am planning to have ?
# 1) If any steps fails, I don't want to proceed further and want to break the script. 
# 2) I want validation to happen first and then if it's a root or sudo user,then only I want to run. If not, I'd like to break the script.
# 3) I would like to add Success / Failure messages next to each instruction.
