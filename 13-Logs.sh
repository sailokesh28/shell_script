#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"


VALIDATE(){
   if [ $1 -ne 0 ]
then 
    echo -e "$2.....$R Failure"
    exit 1
else
    echo -e "$2.....$G Success"
fi 
}
echo "Script Started Executing at : $TIMESTAMP" &>> $LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "Error :: You Must be root user to run this script"
    exit 1 #other than 0
fi

dnf list installed mysql &>> $LOG_FILE_NAME

if [ $? -ne 0 ] # not installed
then
    dnf install mysql -y &>> $LOG_FILE_NAME
    VALIDATE $? "Insatlling Mysql"
if [ $? -ne 0 ]
then 
    echo "Insatlling Mysql.....Failure"
    exit 1
else
    echo "Installing Mysql.....Success"
fi
else 
    echo -e "Mysql is already $Y Installed"
fi

  
  dnf list installed git &>> $LOG_FILE_NAME

if [ $? -ne 0 ] # not installed
then
    dnf install git -y &>> $LOG_FILE_NAME
    VALIDATE $? "Insatlling Git"
else 
    echo -e "Git is already .....$Y Installed"
fi