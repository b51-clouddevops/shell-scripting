#!/bin/bash 

COMPONENT=mysql

source components/common.sh

echo -n "Configuring the $COMPONENT Repo:"
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/stans-robot-project/mysql/main/mysql.repo &>> $LOGFILE 
stat $? 

echo -n "Installing $COMPONENT:"
yum install mysql-community-server -y &>> $LOGFILE 
stat $? 

echo -n "Starting $COMPONENT service: "
systemctl enable mysqld && systemctl start mysqld
stat $?

# echo -n "Changing the default password:"
# grep 'temporary passsword' /var/log/mysqld.log


