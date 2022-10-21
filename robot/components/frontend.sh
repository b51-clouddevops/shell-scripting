#!/bin/bash 
set -e 

# Verify the script is been executed as a root user or not.
USERID=$(id -u) 
COMPONENT=frontend
LOGFILE=/tmp/$COMPONENT.log

if [ $USERID -ne 0 ]  ; then 
    echo -e "\e[31m You must run this script as a root user or with sudo privilege \e[0m"
    exit 1
fi 

stat() {
    if [ $1 -eq 0 ]; then 
        echo -e "\e[32m Success \e[0m"
    else 
        echo -e "\e[31m Failure \e[0m"
    fi 
}

echo -n "Installing Ngnix:"
yum install nginx -y &>> /tmp/$COMPONENT.log
stat $?

echo -n "Downloading the component: "
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "Performing Cleanup:"
rm -rf /usr/share/nginx/html/*  &>> /tmp/$COMPONENT.log
stat $?

cd /usr/share/nginx/html
echo -n "Unzipping the $COMPONENT:"
unzip /tmp/$COMPONENT.zip &>> /tmp/$COMPONENT.log
stat $? 
mv $COMPONENT-main/* .
mv static/* .
rm -rf $COMPONENT-main README.md

echo -n "Conifuring the reverse proxy file:"
mv localhost.conf /etc/nginx/default.d/roboshop.conf

echo -n "Starting Frontend Service:"
systemctl enable nginx &>> /tmp/$COMPONENT.log
systemctl start nginx &>> /tmp/$COMPONENT.log
stat $?


# What I am planning to have ?
# 1) If any steps fails, I don't want to proceed further and want to break the script. 
# 2) I want validation to happen first and then if it's a root or sudo user,then only I want to run. If not, I'd like to break the script.
# 3) I would like to add Success / Failure messages next to each instruction.
