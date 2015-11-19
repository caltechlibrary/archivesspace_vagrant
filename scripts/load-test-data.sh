#!/bin/bash
#
#  load-test-data.sh - Based on the environment described in setup.conf, load
#  the test data generate with generate-test-data.sh
#
#  @author R. S. Doiel, <rsdoiel@calteche.edu>
#  copyright (c) 2015 all rights reserved
#  Caltech Library
#

function authenticate() {
    echo "Authenticating $ASPACE_PROTOCOL_PRODUCTION://$ASPACE_HOST:$ASPACE_PORT/users/$ASPACE_USERNAME/login"
    RESPONSE=$(curl -Fpassword=$ASPACE_PASSWORD "$ASPACE_PROTOCOL://$ASPACE_HOST:$ASPACE_PORT/users/$ASPACE_USERNAME/login")
    session=$(echo $RESPONSE | cut -d , -f 1 | cut -d : -f 2 | sed -e 's/"//g')
    echo "Auth token: $session"
    export ASPACE_AUTH_TOKEN=$session
}

if [ -f setup.conf ]; then
    echo "Loading configuration from setup.conf"
    . setup.conf
else
    echo "create setup.conf based on setup.conf-example"
    echo "then source setup.conf so the configuration is available via the Unix environment"
    exit 1
fi

