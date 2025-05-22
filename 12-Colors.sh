#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
]

VALIDATE(){
   if [ $1 -ne 0 ]
then 
    echo -e "$2.....$R Failure"
    exit 1
else
    echo -e "$2.....$G Success"
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
    echo -e "Mysql is already $Y Installed"
fi


dnf list installed git 

if [ $? -ne 0 ] # not installed
then
    dnf install git -y
    VALIDATE $? "Insatlling Git"
else 
    echo -e "Git is already .....$Y Installed"
fi