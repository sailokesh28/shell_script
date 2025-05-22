#!/bin/bash
USERID=$(id -u)

VALIDATE(){
   if [ $1 -ne 0 ]
then 
    echo "$2.....Failure"
    exit 1
else
    echo "$2.....Success"
fi 
}

if [ $USERID -ne 0 ]
then
    echo "Error :: You Must be root user to run this script"
    exit 1 #other than 0
fi

dnf list installed mysql 

if [ $? -ne 0 ] # not installed
then
    dnf install mysql -y
    VALIDATE $? "Insatlling Mysql"
if [ $? -ne 0 ]
then 
    echo "Insatlling Mysql.....Failure"
    exit 1
else
    echo "Installing Mysql.....Success"
fi
else 
    echo "Mysql is already installed"
fi


dnf list installed git 

if [ $? -ne 0 ] # not installed
then
    dnf install git -y
    VALIDATE $? "Insatlling Git"
else 
    echo "Git is already installed"
fi