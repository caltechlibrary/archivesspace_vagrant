#!/bin/bash
#
#  create-repository.sh - Create a development repository in ArchivesSpace based
#  on the environment described in setup.conf.
#
#  @author R. S. Doiel, <rsdoiel@calteche.edu>
#  copyright (c) 2015 all rights reserved
#  Caltech Library
#

function authenticate() {
    echo "Authenticating $ASPACE_PROTOCOL://$ASPACE_HOST:$ASPACE_PORT/users/$ASPACE_USERNAME/login"
    RESPONSE=$(curl -Fpassword=$ASPACE_PASSWORD "$ASPACE_PROTOCOL://$ASPACE_HOST:$ASPACE_PORT/users/$ASPACE_USERNAME/login")
    session=$(echo $RESPONSE | cut -d , -f 1 | cut -d : -f 2 | sed -e 's/"//g')
    echo "Auth token: $session"
    export ASPACE_AUTH_TOKEN=$session
}

function createRepo() {
    echo "Requesting $ASPACE_REPOSITORY_ID, '$ASPACE_REPOSITORY_NAME' be created at $ASPACE_PROTOCOL://$ASPACE_HOST:$ASPACE_PORT/repositories"
    curl -H "X-ArchivesSpace-Session: $ASPACE_AUTH_TOKEN" \
        -d "{\"repo_code\": \"$ASPACE_REPOSITORY_ID\", \"name\": \"$ASPACE_REPOSITORY_NAME\"}" \
           "$ASPACE_PROTOCOL://$ASPACE_HOST:$ASPACE_PORT/repositories"
}

if [ -f setup.conf ]; then
    echo "Loading configuration from setup.conf"
    . setup.conf
else
    echo "create setup.conf based on setup.conf-example"
fi

authenticate
createRepo
