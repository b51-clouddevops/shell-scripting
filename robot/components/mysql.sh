#!/bin/bash 

COMPONENT=mysql

source components/common.sh

echo -n "Configuring the MySql Repo:"
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/stans-robot-project/mysql/main/mysql.repo