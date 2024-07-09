#!/bin/bash
#
#   This script will back up $HOME directory and keep it at /opt/backup
#   /opt/backup would keep 5 archives, whenever new backup is created, the oldest one is removed
#   Exclude directory: .cache and .local
#   

# back up 
BACKUP_FILE="home_backup_$(date +%Y_%b_%d).tar.gz"

BACKUP_DIR="/opt/backup"

EXCLUDE_DIRS="--exclude=$HOME/.cache --exclude=$HOME/.local"

tar -czf "$BACKUP_DIR/$BACKUP_FILE" $EXCLUDE_DIRS "$HOME"



# remove archives
delete_oldest_file() {
    OLDEST_FILE=$(find "$BACKUP_DIR" -type f -printf '%T@ %p\n' | sort | head -n 1 | awk '{print $2}')

    if [ $(find "$DIRECTORY" -type f | wc -l) -gt 5 ]; then
        rm "$OLDEST_FILE"
    fi
}
