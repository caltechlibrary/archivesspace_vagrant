#!/bin/bash

if [ "$USER" != "vagrant" ]; then
	echo "Run this script as the vagrant user."
	exit 1
fi

echo "Drop and create a blank DB"
echo "DROP DATABASE IF EXISTS archivesspace" | mysql
mysql < $HOME/archivesspace-mysql-setup.sql
echo "Clear any Solr indexes"
cd /archivesspace
sudo rm -rf data/frontend_cookie_secret_cookie_secret.dat \
	data/public_cookie_secret_cookie_secret.dat \
	data/indexer_state/ data/solr_backups/* \
	data/solr_index/* data/tmp/* 

echo
echo "Ready to create a new ArchivesSpace DB"
echo "Change directory to /archivesspace"
echo "Run scripts/setup-database.sh"
echo
echo "Afterwards you can run ./archivesspace.sh to start the services"
echo
cd /archivesspace

