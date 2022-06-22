#!/bin/bash

sudo apt update
sudo apt install python3-pip python3.9 -y

cd /data/

sudo wget testurl.ru/bkp.zip
sudo unzip bkp.zip
sudo rm -rf bkp.zip

cd /data/autobcp/

sudo pip3 install -r ./requirements.txt

cd /data/

sudo mkdir /data/py_bcp_folder
sudo chmod -R 777  /data/py_bcp_folder/

sudo cp /opt/firebird/lib/libfbclient.so.2 /usr/lib

echo -e "Код склада:"
read REGION
dir=$REGION

sudo mv /data/autobcp/XXXX.ini /data/autobcp/$dir.ini

sed -i 's/KOD/'"$dir"'/g' /data/autobcp/$dir.ini

echo -e "SEVER_NAME: hint -> ya-tr-wbt-db-1-p"
read HOSTNAME
A=$HOSTNAME
sed -i 's/HST/'"$A"'/g' /data/autobcp/$dir.ini

echo -e "DATABASE_ALIAS: hint -> TUR, AZE"
read ALIAS
B=$ALIAS
sed -i 's/ALS/'"$B"'/g' /data/autobcp/$dir.ini

echo -e "CLEAR_BASE_NAME: hint -> tur, aze"
read CBN
C=$CBN
sed -i 's/basename/'"$C"'/g' /data/autobcp/$dir.ini

echo -e "API URL: hint -> talian-api-wms39.faberlic.com"
read API
C=$API
sed -i 's/apurl/'"$C"'/g' /data/autobcp/$dir.ini

#Создание скрипта запуска

sed -i 's/KOD/'"$dir"'/g' /data/autobcp/start.sh

sudo chmod +x /data/autobcp/start.sh

echo -e "Установка завершена"

exit 0
