#!/bin/bash 
set -e 

COMPONENT=frontend

source components/common.sh

echo -n "Installing Ngnix:"
yum install nginx -y &>> $LOGFILE
stat $?



# curl -L https://raw.githubusercontent.com/stans-robot-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo
# yum install redis-6.2.7 -y

# vim /etc/redis.conf
# vim /etc/redis/redis.conf

```sql
# vim /etc/redis.conf
# vim /etc/redis/redis.conf
```
