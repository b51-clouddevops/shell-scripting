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

echo -n "Changing the default password:"
DEF_ROOT_PASSWORD=$(grep 'A temporary password' /var/log/mysqld.log | awk -F ' ' '{print $NF}')

# I only want to change the default password only for the first time.
# How do I come to know whether the password is changed or not.

echo show databases | mysql -uroot -pRoboShop@1 &>> $LOGFILE 
if [ $? -ne 0 ] ; then 
    echo -n "Reset Root Password"
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@1';" | mysql  --connect-expired-password  -uroot -p"${DEF_ROOT_PASSWORD}" &>> $LOGFILE 
    stat $? 
fi 

echo show plugins | mysql -uroot -pRoboShop@1 | grep validate_password; &>> $LOGFILE 
if [ $? -eq 0 ] ; then 
    echo -n "Uninstalling Password Validate Plugin: "
    echo "uninstall plugin validate_password;" | mysql  --connect-expired-password  -uroot -pRoboShop@1 &>> $LOGFILE 
    stat $? 
fi 

echo -n "Downloading the $COMPONENT Schema:"

