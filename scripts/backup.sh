#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/colors.sh"

BACKUP_DIR="$SCRIPT_DIR/../backups"
mkdir -p "$BACKUP_DIR"

DATE=$(date +%F)

ARCHIVE="$BACKUP_DIR/backup_$DATE.tar.gz"

print_header
print_info "Starting backup process..."

separator

sudo tar -czf "$ARCHIVE" /etc /home 2>/dev/null

if [ $? -eq 0 ]
then

print_success "Backup created: $ARCHIVE"

else

print_error "Backup failed"

fi
