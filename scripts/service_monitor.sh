#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/colors.sh"

LOG_DIR="$SCRIPT_DIR/../logs"
mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/services.log"

services=("nginx" "docker" "ssh")

print_header
print_info "Checking critical services..."

separator

for service in "${services[@]}"
do

if systemctl list-units --type=service | grep -q "$service"
then

if systemctl is-active --quiet $service
then
print_success "$service is running"
echo "$(date) | $service running" >> "$LOG_FILE"

else
print_warning "$service stopped — restarting..."

sudo systemctl restart $service

if systemctl is-active --quiet $service
then
print_success "$service restarted successfully"
echo "$(date) | restarted $service" >> "$LOG_FILE"

else
print_error "Failed to restart $service"
echo "$(date) | restart failed $service" >> "$LOG_FILE"
fi

fi

else

print_warning "$service not installed on system"
echo "$(date) | $service not installed" >> "$LOG_FILE"

fi

done

separator
