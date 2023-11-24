#!/usr/bin/env bash

DATABASENAME=${1:-'mywebshop'}
shift

echo "Restoring data to database $DATABASENAME using $*"

dropdb $* $DATABASENAME
createdb $* $DATABASENAME

for name in create products articles labels customer address order order_positions stock; do
  echo "========== $name =========="
  psql $* -d $DATABASENAME -f data/$name.sql
done
