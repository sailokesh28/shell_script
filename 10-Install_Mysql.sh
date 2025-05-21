
#!/bin/bash
USERID=$(id -u)

if [$USERID -ne 0 ]
then
    echo "Error :: You Must be root user to run this script"
fi
dnf insatll mysql -y