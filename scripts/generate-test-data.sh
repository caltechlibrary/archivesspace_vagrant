#!/bin/bash
#
#  generate-test-data.sh - Based on the environment described in setup.conf,
#  contact the production deployment and request a data dump suitable for
#  development purposes.
#
#  @author R. S. Doiel, <rsdoiel@calteche.edu>
#  copyright (c) 2015 all rights reserved
#  Caltech Library
#

function authProduction() {
    echo "Authenticating $ASPACE_PROTOCOL_PRODUCTION://$ASPACE_HOST_PRODUCTION:$ASPACE_PORT_PRODUCTION/users/$ASPACE_USERNAME_PRODUCTION/login"
    RESPONSE=$(curl -Fpassword=$ASPACE_PASSWORD_PRODCUTION "$ASPACE_PROTOCOL_PRODUCTION://$ASPACE_HOST_PRODUCTION:$ASPACE_PORT_PRODUCTION/users/$ASPACE_USERNAME_PRODUCTION/login")
    session=$(echo $RESPONSE | cut -d , -f 1 | cut -d : -f 2 | sed -e 's/"//g')
    echo "Auth token: $session"
    export ASPACE_AUTH_TOKEN=$session
}

function getAgents() {
    # FIXME: need something that gets all the ids for agents in repository and saves it as a text file
    # FIXME: for each id in saved text file pull and format an record suitable to push into a new AS instance.
}

function getAccessions() {
    # FIXME: need something that gets all the ids for accessions in repository and saves it as a text file
    # FIXME: for each id in saved text file pull and format an record suitable to push into a new AS instance.
}

function getLocations() {
    # FIXME: need something that gets all the ids for locations in repository and saves it as a text file
    # FIXME: for each id in saved text file pull and format an record suitable to push into a new AS instance.
}

function getDigitalObjects() {
    # FIXME: need something that gets all the ids for locations in repository and saves it as a text file
    # FIXME: for each id in saved text file pull and format an record suitable to push into a new AS instance.
}

if [ -f setup.conf ]; then
    echo "Loading configuration from setup.conf"
    . setup.conf
else
    echo "create setup.conf based on setup.conf-example"
fi

authProduction
getAgents
getAccessions
getLocations
getDigitalObjects
