
# Basic Install/migration process

After you have exported the Excel files from FMP into the data folder. It also assumes you've run preprocessing Java program to create profiles_corprate Excel file.

## Initial setup

1.      Bring up vagrant
        -       vagrant up
2.      SSH into vagrant instance
        -       vagrant ssh
3.      Change to the /vagrant directory and run the final-installation-step.sh
        -       cd /vagrant && bash setup/final-installation-step.sh
4.      Wait for AS to startup and point your browser at http://localhost:8080 to confirm

## Load development data

Initially ArchivesSpace is configured but lacking data isn't terribly interesting. These are the steps
taken to dump a production dataset to use as a development dataset.

