#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=2

while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION"
mysql -uroot -e "CHANGE MASTER TO MASTER_HOST='sql-master.dockersqltest_default',MASTER_USER='root', MASTER_LOG_FILE='mysql-bin.000004', MASTER_LOG_POS=120"
mysql -uroot -e "START SLAVE"

mysqladmin -uroot shutdown