#!/bin/bash 

COMPONENT=catalogue

source components/common.sh
APPUSER=roboshop

NODEJS

# id $APPUSER &>> $LOGFILE 
# if [ $? -ne 0 ]; then
#     echo -n "Creating App User:"
#     useradd $APPUSER &>> $LOGFILE
#     stat $?
# fi 

echo -n "Downloading the $COMPONENT:"
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $? 

echo -n "Moving $COMPONENT Code to $APPUSER home directory:"
cd /home/$APPUSER/ 
unzip -o /tmp/$COMPONENT.zip  &>> $LOGFILE
stat $? 

echo -n "Performing Cleanup:"
rm -rf $COMPONENT
mv $COMPONENT-main $COMPONENT
stat $? 

echo -n "Installing nodejs dependencies:"
cd $COMPONENT 
npm install  &>> $LOGFILE
stat $?

echo -n "Changing permissions to $APPUSER"
chown -R $APPUSER:$APPUSER /home/roboshop/$COMPONENT &&  chmod -R 775 /home/roboshop/$COMPONENT 
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
