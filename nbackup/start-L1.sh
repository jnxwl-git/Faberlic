#!/bin/bash

curdate=`date +%F_%T`
dbuser=SYSDBA
dbpassword=masterkey
dbname=/data/test/TEST.FDB
bkpath=/data/test/backup
backup_name=WMS_TEST_LV1_
ext=.fbk
bkfile=$bkpath/$backup_name$curdate$ext

nbackup -U $dbuser -P $dbpassword -B 1 $dbname $bkfile
