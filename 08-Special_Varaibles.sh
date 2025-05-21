#!bin/bash

echo "All variables passed: $@"
echo "Number of Variables : $#"
echo "Script Name: $0"
echo "Present Working directory: $PWD"
echo "User ID: $UID"
echo "Shell Name: $SHELL"
echo "Home Directory: $HOME"
echo "Terminal Type: $TERM"
echo "Last Command Exit Status: $?"
echo "Current Date: $(date)"
ECHO "Which user is running this script: $USER"

sleep 60 &
echo "Last Background Process ID: $!"
