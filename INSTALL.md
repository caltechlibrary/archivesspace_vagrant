
# Basic Install/migration process

After you have exported the Excel files from FMP into the data folder. It also assumes you've run preprocessing Java program to create profiles_corprate Excel file.

## Initial setup

1.      Bring up vagrant
        -       vagrant up
2.      SSH into vagrant instance
        -       vagrant ssh
3.      Change to the sync directory and run the final-installation-step.sh
        -       cd $HOME/sync && bash setup/final-installation-step.sh
4.      Wait for AS to startup and point your browser at http://localhost:8080 to confirm

## Load development data

Initially ArchivesSpace is configured but lacking data isn't terribly interesting. These are the steps
taken to dump a production dataset to use as a development dataset.


### Example local setup

Here's an example of what I would type on my Mac in a Terminal window for the whole process

```
        mkdir git-repos
        cd git-repos
        git clone git@github.com:caltechlibrary/archivesspace_vagrant
        cd archivesspace_vagrant
        vagrant up
        vagrant ssh
        # At this point I've SSH'd to the vagrante virtual machine instance
        bash setup/final-installation-step.sh
        # This take a little while to run, there are some prompts to answer
        # When complete we'll switch the archivesspace user and start archivesspace
        sudo /etc/init.d/archivesspace # ArchivesSpace launches daemon, logging is in log/archivesspace.out
```

To populate the dev instance with data I usually use a snapshot of our producton deployment's MySQL database. This can be done using mysqldump. 
If I have saved my archivesspace MySQL dump as the file named _archivesspace-backup.sql_ I would do the following to load it into my dev environment

```
    vagrant up 
    vagrant ssh
    # Copy the as-backup.sql file to the vagrant instance
    # replace USERNAME@HOSTNAME with your username host of your dev box
    scp USERNAME@HOSTNAME:./archivesspace-backup.sql  ./
    # Drop down to root of virtual box to re-create the ArchivesSpace database
    sudo su
    mysql archivesspace
    # At this point you are int he mysql repl
    DROP DATABASE archivesspace;
    CREATE DATABASE archivesspace;
    USE archivesspace
    source /home/vagrant/archivesspace-backup.sql
    # you should now have a copy of the production data loaded
    quit
    # you are back at the Unix shell prompt
    # Remove the data/solr/indexer_state/* files to cause Solr to your index everything
    sudo rm -fR /archivesspace/data/indexer_state/*
    # Restart archivesspace, this takes a while as it re-index everything
    sudo /etc/init.d/archivesspace stop
    sudo /etc/init.d/archivesspace start
```

