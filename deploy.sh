#!/bin/sh
set -e

echo "Deploying application ..."

# Update codebase
git fetch origin master
git reset --hard origin/master
echo "Codebase updated!"

# Install dependenceies
# source env/bin/activate
pip3 install -r requirements.txt
# deactivate
echo "Install dependencies!"

# Restart services
systemctl status softbytedashboard  | grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        sudo systemctl restart softbytedashboard  > /dev/null
        echo "Python service restarted!"
fi

service nginx status | grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        sudo service nginx restart > /dev/null
        echo "Nginx restarted!"
fi

echo "Application deployed!"
