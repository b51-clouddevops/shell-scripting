#!/bin/bash 
set -e 

COMPONENT=catalogue

source components/common.sh

echo -n "Configuring Node JS:"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash   &>> $LOGFILE

echo -n "Installing Nodejs: "


# curl -sL https://rpm.nodesource.com/setup_lts.x | bash
# yum install nodejs -y

# useradd roboshop

$ curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"
$ cd /home/roboshop
$ unzip /tmp/catalogue.zip
$ mv catalogue-main catalogue
$ cd /home/roboshop/catalogue
$ npm install


1. Update SystemD file with correct IP addresses
    
    Update `MONGO_DNSNAME` with MongoDB Server IP

    