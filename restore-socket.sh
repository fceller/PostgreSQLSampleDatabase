#!/usr/bin/env bash

DATABASENAME=${1:-'mywebshop'}

./restore-common.sh "$DATABASENAME" -U postgres
