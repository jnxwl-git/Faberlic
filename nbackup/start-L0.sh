#!/bin/bash

curdate=`date +%F_%T`
dbuser=SYSDBA
dbpassword=masterkey
dbname=/data/test/TEST.FDB
bkpath=/data/test/backup
backup_name=WMS_TEST_LV0_
ext=.fbk
bkfile=$bkpath/$backup_name$curdate$ext

sudo rm -rf $bkpath/*.fbk

nbackup -U $dbuser -P $dbpassword -B 0 $dbname $bkfile
