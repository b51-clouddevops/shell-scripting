LOGFILE=/tmp/$COMPONENT.log

USERID=$(id -u) 

# User Validation ; Checks whether the user is a root user or not.
if [ $USERID -ne 0 ]  ; then 
    echo -e "\e[31m You must run this script as a root user or with sudo privilege \e[0m"
    exit 1
fi 

stat() {
    if [ $1 -eq 0 ]; then 
        echo -e "\e[32m Success \e[0m"
    else 
        echo -e "\e[31m Failure \e[0m"
    fi 
}


NODEJS() {
    echo -n "Configuring Node JS:"
    curl -sL https://rpm.nodesource.com/setup_lts.x | bash   &>> $LOGFILE
    stat $? 

    echo -n "Installing Nodejs: "
    yum install nodejs -y &>> $LOGFILE
    stat $? 
    
    # Calling create_user function
    CREATE_USER

}

CREATE_USER() {
    id $APPUSER &>> $LOGFILE 
    if [ $? -ne 0 ]; then
        echo -n "Creating App User:"
        useradd $APPUSER &>> $LOGFILE
        stat $?
    fi
} 

DOWNLOAD_AND_EXTRACT() {
    echo -n "Downloading the $COMPONENT:"
    curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
    stat $? 

    echo -n "Performing Cleanup:"
    rm -rf $COMPONENT
    mv $COMPONENT-main $COMPONENT
    stat $? 

    echo -n "Moving $COMPONENT Code to $APPUSER home directory:"
    cd /home/$APPUSER/ 
    unzip -o /tmp/$COMPONENT.zip  &>> $LOGFILE
    stat $? 


}