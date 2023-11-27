#!/usr/bin/env bash

DATABASENAME=$1
shift

echo "Restoring data to database $DATABASENAME using $*"

dropdb $* $DATABASENAME
createdb $* $DATABASENAME

for name in create colors sizes brands products articles cloth trousers address customer order order_positions stock customer_product_rating; do
  echo "========== $name =========="
  psql $* -d $DATABASENAME -f data/$name.sql
done
