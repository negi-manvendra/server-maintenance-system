#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/colors.sh"

REPORT_DIR="$SCRIPT_DIR/../reports"
mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/system_report.txt"

print_header
print_info "Collecting system health information..."

separator

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free -m | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')
UPTIME=$(uptime -p)

echo "System Health Report - $(date)" > "$REPORT_FILE"
echo "--------------------------------------" >> "$REPORT_FILE"

echo "CPU Usage: $CPU%" >> "$REPORT_FILE"
echo "Memory Usage: $MEM%" >> "$REPORT_FILE"
echo "Uptime: $UPTIME" >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "Top Processes:" >> "$REPORT_FILE"

ps aux --sort=-%mem | head -n 6 >> "$REPORT_FILE"

print_success "Health report saved to reports/system_report.txt"
