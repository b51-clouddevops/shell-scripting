#!/bin/bash 

COMPONENT=rabbitmq
source components/common.sh

echo -n "Installing and configuring $COMPONENT repo"
yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y  &>> $LOGFILE 



echo -e "\e[32m __________ $COMPONENT Installation Completed _________ \e[0m"
