#!/bin/bash

# Variables
DATE=$(date +%F)
DB_BACKUP_PATH='/backup/dbbackup'
DB_USER='root'
DB_PASS='password'
DB_NAME='mydb'

# Create backup directory
mkdir -p "${DB_BACKUP_PATH}/${DATE}"

# Perform the database backup
if mysqldump -u"${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" > "${DB_BACKUP_PATH}/${DATE}/${DB_NAME}.sql"; then
    echo "Backup completed successfully for database ${DB_NAME}."
else
    echo "Backup failed for database ${DB_NAME}." >&2
    exit 1
fi

