#!/bin/bash

## Stop MySQL and start with --skip-grant-tables ##
sudo serivce mysql stop
sudo mysqld_safe --skip-grant-tables --skip-networking &
mysql -uroot

## Set password to none ## 
use mysql;
update user set password=null where User='root';
flush privileges;
quit;