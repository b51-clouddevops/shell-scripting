#!/bin/bash 

COMPONENT=catalogue

source components/common.sh
APPUSER=roboshop

NODEJS


echo -n "Installing nodejs dependencies:"
cd $COMPONENT 
npm install  &>> $LOGFILE
stat $?

echo -n "Configuring $COMPONENT Service:"
sed -i -e 's/MONGO_DNSNAME/mongodb.robot.internal/' /home/roboshop/$COMPONENT/systemd.service
mv /home/$APPUSER/$COMPONENT/systemd.service /etc/systemd/system/$COMPONENT.service
stat $? 

echo -n "Starting $COMPONENT Service:"
systemctl daemon-reload &>> $LOGFILE
systemctl start $COMPONENT &>> $LOGFILE
stat $? 

echo -e "\e[32m __________ $COMPONENT Installation Completed _________ \e[0m"
