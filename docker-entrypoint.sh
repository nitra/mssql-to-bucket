#!/bin/bash -eux

# Filename with datetime
fullname=$DB_FILE"-$(date +"%Y-%m-%d-%H-%M").sql"

# Backup remote DB
mssql-scripter --schema-and-data  > ./$fullname
# TODO: check success backup

gzip $fullname

gsutil cp $fullname".gz" gs://$BUCKET
