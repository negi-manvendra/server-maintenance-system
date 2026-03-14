#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/colors.sh"

print_header
print_info "Starting full maintenance run..."

separator

print_info "Running Disk Monitor..."
bash "$SCRIPT_DIR/disk_monitor.sh"

separator

print_info "Running System Health Check..."
bash "$SCRIPT_DIR/system_health.sh"

separator

print_info "Running Service Monitor..."
bash "$SCRIPT_DIR/service_monitor.sh"

separator

print_info "Running Log Cleanup..."
bash "$SCRIPT_DIR/log_cleanup.sh"

separator

print_info "Running Backup..."
bash "$SCRIPT_DIR/backup.sh"

separator

print_success "Maintenance completed successfully."
