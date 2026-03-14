#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/colors.sh"

LOG_DIR="$SCRIPT_DIR/../logs"
mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/disk.log"
THRESHOLD=80

print_header
print_info "Running Disk Usage Monitor..."

separator

df -h | tail -n +2 | while read line
do
usage=$(echo $line | awk '{print $5}' | sed 's/%//')
filesystem=$(echo $line | awk '{print $1}')
used=$(echo $line | awk '{print $3}')
avail=$(echo $line | awk '{print $4}')

if [ "$usage" -ge "$THRESHOLD" ]; then
print_warning "$filesystem usage is ${usage}%"
status="WARNING"
else
print_success "$filesystem usage is ${usage}%"
status="OK"
fi

echo "$(date) | $filesystem | $usage% | $status" >> "$LOG_FILE"

done

separator
print_success "Disk monitoring completed."
