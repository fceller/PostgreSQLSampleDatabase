#!/usr/bin/env bash

DATABASENAME=${1:-'mywebshop'}

./restore-common.sh "$DATABASENAME" -h localhost -p 5432 -U postgres
