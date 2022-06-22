#!/bin/bash

sudo gfix -user "SYSDBA" -password "masterkey" -shut -force 0 /data/Base/ALS.FDB

/opt/firebird/bin/gbak -B -G -V -user SYSDBA -pas masterkey /data/Base/ALS.FDB /backup/db/ALS.FBK

sudo gfix -o ALS.FDB

cd /backup

zip -9 /backup/ALS_backup.zip /backup/db/ALS.FBK

sudo cp /backup/ALS_backup.zip /backup/zip

sudo cp /data/Base/ALS.FDB /backup/db

sudo rm -rf /backup/*.zip
