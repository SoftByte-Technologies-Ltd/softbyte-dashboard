#!/bin/bash
git pull

source env/bin/activate
pip3 install -r requirements.txt
deactivate

systemctl status softbytedashboard  | grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        sudo systemctl restart softbytedashboard  > /dev/null
fi

service nginx status | grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        sudo service nginx restart > /dev/null
fi