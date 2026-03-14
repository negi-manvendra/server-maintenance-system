#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/colors.sh"

LOG_DIR="$SCRIPT_DIR/../logs"
mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/cleanup.log"

TARGET_DIR="/var/log"
DAYS=7

print_header
print_info "Cleaning logs older than $DAYS days..."

separator

files=$(sudo find $TARGET_DIR -type f -name "*.log" -mtime +$DAYS)

for file in $files
do

sudo rm -f "$file"

print_warning "Deleted $file"

echo "$(date) | deleted $file" >> "$LOG_FILE"

done

separator
print_success "Log cleanup finished."
