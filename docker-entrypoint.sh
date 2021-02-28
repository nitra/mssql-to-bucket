#!/bin/bash -euxo pipefail

# Backup remote DB
mssql-scripter --schema-and-data  > ./$DB_FILE.sql
# TODO: check success backup

gzip $DB_FILE.sql

gsutil cp $DB_FILE.sql.gz gs://b2b-db-backup
