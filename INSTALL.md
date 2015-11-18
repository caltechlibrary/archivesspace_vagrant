
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


### Setup local configuration

The following can be executed from your development machine but should also work from a VM if necessary..

1. Copy setup.conf-example to setup.conf
2. Edit setup.conf to reflect our local development setup as well as point to the production deployment (so we can grab data for development)
3. Source the setup.conf
4. Run scripts/create-repository.sh
5. Run scripts/generate-test-data.sh
6. Run scripts/load-test-data.sh

Here's an example of what I would type on my Mac in a Terminal window for the whole process

```
        mkdir git-repos
        cd git-repos
        git clone git@github.com:caltechlibrary/archivesspace_vagrant
        cd archivesspace_vagrant
        vagrant up
        vagrant ssh
        # At this point I've SSH'd to the vagrante virtual machine instance
        cd /vagrant
        bash setup/final-installation-step.sh
        # This take a little while to run, there are some prompts to answer
        # When complete we'll switch the archivesspace user and start archivesspace
        sudo su - archivesspace
        cd /archivesspace
        ./archivesspace.sh # ArchivesSpace launches and is logging to console.
```

Start another Terminal Window

```
        cd git-repos/archivesspace_vagrant
        cp setup.conf-example setup.conf
        # Edit setup.conf to fit your setup.
        vi setup.conf
        # Now source the setup.conf so we can run our various utilities and pickup the configuration
        . setup.conf
        # Generate a new repository
        bash scripts/create-repository.sh
        # Dump some data from the production system to use
        bash scripts/generate-test-data.sh
        # Finally load the tests data so you can do some development
        bash scripts/load-test-data.sh
```

If you've already create your vagrant instance some of the steps con be omitted or abbrivated.
