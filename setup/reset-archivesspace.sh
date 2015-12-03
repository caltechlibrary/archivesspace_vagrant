#!/bin/bash

if [ "$USER" != "vagrant" ] && [ "$USER" != "root" ]; then
	echo "Run this script as the vagrant or root user."
	exit 1
fi

echo "Drop and create a blank DB"
echo "DROP DATABASE IF EXISTS archivessapce;CREATE DATABASE IF NOT EXISTS archivesspace;" | mysql
echo "Clear any Solr indexes"
cd /archivesspace
sudo rm -rf data/frontend_cookie_secret_cookie_secret.dat \
	data/public_cookie_secret_cookie_secret.dat \
	data/indexer_state/ data/solr_backups/* \
	data/solr_index/* data/tmp/*

echo
echo "Ready to create a new ArchivesSpace DB environment"
echo ""
echo -e "\tsudo su - archivesspace"
echo -e "\tcd /archivesspace"
echo -e "\tbash scripts/setup-database.sh"
echo -e "\t./archivesspace.sh"
echo
