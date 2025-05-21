
#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error :: You Must be root user to run this script"
    exit 1
fi
dnf install mysql -y

dnf install git -y
