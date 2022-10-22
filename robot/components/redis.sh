#!/bin/bash 
set -e 

COMPONENT=redis

source components/common.sh

echo -n "Configuring $COMPONENT repo:"
curl -L https://raw.githubusercontent.com/stans-robot-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo
stat $? 

echo -n "Installing $COMPONENT:"
yum install redis-6.2.7 -y  &>> $LOGFILE



# vim /etc/redis.conf
# vim /etc/redis/redis.conf
```
