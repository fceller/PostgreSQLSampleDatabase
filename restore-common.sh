#!/usr/bin/env bash

DATABASENAME=$1
shift

echo "Restoring data to database $DATABASENAME using $*"

dropdb $* $DATABASENAME
createdb $* $DATABASENAME

for name in create colors sizes brands products articles clothes trousers addresses customers orders order_positions stocks customer_product_rating; do
  echo "========== $name =========="
  psql $* -d $DATABASENAME -f data/$name.sql
done
