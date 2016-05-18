
If you want to load test data from the v1.4.2 release of archivesspace into the VM running v1.5.x you can do so
but you will need to do some manual intervension.

1. Run "vagrant up" as usual
2. Run the setup/final-installation-steps.sh script but don't start ArchivesSpace with "sudo /etc/init.d/archivesspace"
3. Using the MySQL client drop and re-create the archivesspace database using your version 1.4.2 data
4. Change directory to /archivesspace and run "scripts/setup-database.sh"
5. Run "scripts/password-reset.sh" if needed
6. Now you can start ArchivesSpace and the v1.4.2 content should migrate properly into v1.5.0 installation on startup
    + "sudo /etc/init.d/archivesspace"


