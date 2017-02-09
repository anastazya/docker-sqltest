#!/bin/bash

volume_home="/var/lib/mysql"

echo "Cleanup .. stand by ..."

# Clean the old database - if needed
# sudo rm -Rf $volume_home/*

if [[ ! -d $volume_home/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $volume_home"
    echo "=> Installing MySQL ..."
    if [ ! -f /usr/share/mysql/my-default.cnf ] ; then
        cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf
    fi 
    mysql_install_db
    echo "=> Done!"  
    /sql_users.sh
else
    echo "=> Using an existing volume of MySQL"
fi

exec supervisord -n