#!bin/bash

USERID=$(id -u)

# Colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"]


# Create log directory if not exists
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

# Validate Functions
VALIDATE(){
   if [ $1 -ne 0 ]
then 
    echo -e "$2.....$R Failure $N"
    exit 1
else
    echo -e "$2.....$G Success $N"
fi 
}


echo "Script Started Executing at : $TIMESTAMP" &>> $LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "Error :: You Must be root user to run this script"
    exit 1 #other than 0
fi

for pacakege in $@
do
    dnf list insatlled $pacakage &>> $LOG_FILE_NAME
    if [ $? -ne 0 ] # not installed
    then
    dnf install $pacakage -y &>> $LOG_FILE_NAME
    VALIDATE $? "Insatlling $pacakage"
    else 
    echo -e "$pacakage is already $Y Installed $N"
    fi
done