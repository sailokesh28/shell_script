
#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error :: You Must be root user to run this script"
fi
dnf install mysql -y
exit1
dnf install git -y
exit1