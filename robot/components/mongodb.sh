#!/bin/bash 
set -e 

# Verify the script is been executed as a root user or not.
USERID=$(id -u) 
COMPONENT=mongodb



echo -n "Installing Ngnix:"
yum install nginx -y &>> $LOGFILE
stat $?

echo -n "Downloading the component: "
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "Performing Cleanup:"
rm -rf /usr/share/nginx/html/*  &>> $LOGFILE
stat $?

cd /usr/share/nginx/html
echo -n "Unzipping the $COMPONENT:"
unzip /tmp/$COMPONENT.zip &>> $LOGFILE
stat $? 
mv $COMPONENT-main/* .
mv static/* .
rm -rf $COMPONENT-main README.md &>> $LOGFILE

echo -n "Conifuring the reverse proxy file:"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "Starting Frontend Service:"
systemctl enable nginx &>> $LOGFILE
systemctl start nginx &>> $LOGFILE
stat $?


# What I am planning to have ?
# 1) If any steps fails, I don't want to proceed further and want to break the script. 
# 2) I want validation to happen first and then if it's a root or sudo user,then only I want to run. If not, I'd like to break the script.
# 3) I would like to add Success / Failure messages next to each instruction.
