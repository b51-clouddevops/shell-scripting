#!/bin/bash 

yum install nginx -y 

curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"


systemctl enable nginx 
systemctl start nginx 
