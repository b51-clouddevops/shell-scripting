#!/bin/bash 

COMPONENT=rabbitmq
source components/common.sh

echo -n "Installing and configuring $COMPONENT repo"
yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y  &>> $LOGFILE 
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash  &>> $LOGFILE 
stat $? 

echo -n "Installing $COMPONENT : "
yum install rabbitmq-server -y &>> $LOGFILE 
stat $?

echo -n "Starting $COMPONENT :"
systemctl enable rabbitmq-server  &>> $LOGFILE 
systemctl start rabbitmq-server  &>> $LOGFILE 
stat $? 

echo -n "Creating Applicaiton user on $COMPONENT: "
rabbitmqctl add_user roboshop roboshop123
stat $?


echo -e "\e[32m __________ $COMPONENT Installation Completed _________ \e[0m"
