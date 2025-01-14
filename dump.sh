#!/usr/bin/env bash

DATABASENAME=${1:-'mywebshop'}
CONNECTION="-U postgres"

echo "Dumping data from database $DATABASENAME to folder data/"

pg_dump $CONNECTION $DATABASENAME  --schema-only --schema=webshop --schema=public > data/create.sql

for name in colors sizes products articles clothes trousers brands customers addresses orders order_positions stocks customer_product_rating; do
  pg_dump $CONNECTION $DATABASENAME --data-only --table=webshop.$name > data/$name.sql
done
