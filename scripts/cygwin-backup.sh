#!/bin/sh
echo "Creating bat file with required command to install cygwin with packages installed on this machine..."
echo "Make sure you've downloaded setup-x86_64.exe and that it's accessible before running the bat file"
echo -n "setup-x86_64.exe -P " > cygwin-setup.bat
cygcheck -c -d | sed -e "1,2d" -e 's/ .*$//' | awk 'NR==1{printf $1}{printf ",%s", $1}' >> cygwin-setup.bat

