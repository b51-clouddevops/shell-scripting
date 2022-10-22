#!/bin/bash 

COMPONENT=catalogue

source components/common.sh
APPUSER=roboshop

echo -n "Configuring Node JS:"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash   &>> $LOGFILE
stat $? 

echo -n "Installing Nodejs: "
yum install nodejs -y &>> $LOGFILE
stat $? 

id $APPUSER &>> $LOGFILE 
if [ $? -ne 0 ]; then
    echo -n "Creating App User:"
    useradd $APPUSER &>> $LOGFILE
    stat $?
fi 

echo -n "Downloading the $COMPONENT:"
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"
stat $? 

echo -n "Moving $COMPONENT Code to $APPUSER home directory:"
cd /home/$APPUSER/ 
unzip -o /tmp/catalogue.zip  &>> $LOGFILE
stat $? 

echo -n "Performing Clearnup:"
rm -rf $COMPONENT
mv $COMPONENT-main $COMPONENT
stat $? 

echo -n "Installing nodejs dependencies:"
cd $COMPONENT 
npm install  &>> $LOGFILE
stat $?

echo -n "Changing permissions to $APPUSER"
chown -R $APPUSER:$APPUSER /home/roboshop/$COMPONENT 
stat $?

echo -n "Configuring $COMPONENT Service:"
sed -e 's/MONGO_DNSNAME/mongodb.robot.internal/' /home/roboshop/$COMPONENT/systemd.service
stat $?


# 1. Update SystemD file with correct IP addresses
    
#     Update `MONGO_DNSNAME` with MongoDB Server IP

# # mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# # systemctl daemon-reload
# # systemctl start catalogue
# # systemctl enable catalogue
# # systemctl status catalogue -l

# NOTE: You should see the log saying `connected to MongoDB`, then only your catalogue
# will work and can fetch the items from MongoDB

# Ref Log:
# {"level":"info","time":1656660782066,"pid":12217,"hostname":"ip-172-31-13-123.ec2.internal","msg":"MongoDB connected","v":1}