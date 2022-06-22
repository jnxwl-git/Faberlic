#!/bin/bash


#прописать в database.conf


#copy DB

sudo mkdir /data/backup
sudo mkdir /backup/zip
sudo mkdir /backup/db

sudo chmod 777 -R /backup

cd /data/backup

sudo wget testurl.ru/backup.zip

sudo unzip backup.zip

sudo rm -rf backup.zip

sudo timedatectl set-timezone Europe/Moscow

sudo locale-gen ru_RU.UTF-8

sudo update-locale LANG=en_US.UTF-8 LC_TIME="ru_RU.UTF-8"

sudo apt install zip -y

sudo apt install firebird3.0-utils -y

sudo cp /data/backup/backup.service /usr/lib/systemd/system/backup.service

sudo cp /data/backup/backup.timer /usr/lib/systemd/system/backup.timer

sudo chmod +x /data/backup/run.sh

sudo chmod 777 -R /data/backup

echo -e "\033[33mАЛИАС БД: hint => WMS_TUR"
read ALIAS
A=$ALIAS
sudo sed -i 's/ALS/'"$A"'/g' /data/backup/run.sh

echo -e "\033[33mХОСТ БД: hint => ya-kg-wbt-db-1-p"
read HST
B=$HST
sudo sed -i 's/HST/'"$A"'/g' /data/backup/run.sh

echo -e "\033[33ВРЕМЯ BACKUP: hint => 04:00:00"
read TIME
C=$TIME
sudo sed -i 's/TIME/'"$C"'/g' /usr/lib/systemd/system/backup.timer

sudo systemctl enable backup.timer

sudo systemctl start backup.timer

sudo systemctl daemon-reload

exit 0
