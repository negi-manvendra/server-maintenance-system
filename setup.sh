#!/bin/bash

echo "========================================="
echo "Installing Automated Server Maintenance"
echo "========================================="

mkdir -p logs reports backups config

chmod +x scripts/*.sh

echo "Installing cron job..."

(crontab -l 2>/dev/null; echo "0 2 * * * $(pwd)/scripts/run_maintenance.sh") | crontab -

echo ""
echo "Installation Complete"
echo "Daily maintenance scheduled at 2 AM"
