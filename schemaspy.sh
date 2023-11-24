#!/usr/bin/env bash

DATABASENAME=${1:-'mywebshop'}
PASSWORD=${2:-'postgres'}
SCHEMASPY_VERSION='6.0.0'

echo "Running schemaspy for database $DATABASENAME"

#RED='\033[0;31m'
#BLUE='\033[0;34m'
#NC='\033[0m' # No Color

function checkForPostgresDriver {
    if [ ! -f ./postgresql.jar ]; then
        echo "${BLUE}Missing postgresql.jar, downloading…${NC}\n"
        curl -o postgresql.jar https://jdbc.postgresql.org/download/postgresql-42.2.27.jar
    fi
}

function checkForSchemaSpy {
    if [ ! -f ./schemaspy-${SCHEMASPY_VERSION}.jar ]; then
        echo "${BLUE}Missing ${SCHEMASPY_VERSION}, downloading…${NC}\n"
        curl -L -o schemaspy-${SCHEMASPY_VERSION}.jar https://github.com/schemaspy/schemaspy/releases/download/v${SCHEMASPY_VERSION}/schemaspy-${SCHEMASPY_VERSION}.jar
    fi
}

function runSchemaSpy {
    LC_CTYPE="en_US.UTF-8"

    java -jar schemaspy-${SCHEMASPY_VERSION}.jar \
        -t pgsql \
        -dp postgresql.jar \
        -gv /usr/ \
        -renderer :cairo \
        -db ${DATABASENAME} \
        -host localhost:5432 \
        -u postgres \
        -p ${PASSWORD} \
        -s webshop \
        -o schema
}

checkForPostgresDriver
checkForSchemaSpy
runSchemaSpy

# If you get output like
# .org.schemaspy.util.Dot$DotFailure: '/usr/local/bin/dot -Tpng:gd schema/diagrams/order.1degree.dot -oschema/diagrams/order.1degree.png -Tcmapx' failed with return code 139
# you might have installed GraphViz WITHOUT pango.
# Try brew reinstall graphviz --with-librsvg --with-pango
