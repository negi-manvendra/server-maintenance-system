# Automated Server Maintenance System

A Bash-based automation system designed to perform routine Linux server maintenance tasks automatically using scheduled jobs. This project demonstrates how common system administration tasks can be automated to maintain server health, monitor resources, and manage logs and backups.

---

## Project Overview

Managing Linux servers requires performing routine maintenance tasks such as monitoring disk usage, cleaning logs, checking services, and creating backups. Performing these tasks manually can be time-consuming and error-prone.

The **Automated Server Maintenance System** solves this by automating these operations using Bash scripts and Cron scheduling.

This project simulates how DevOps engineers maintain production servers by implementing automated maintenance workflows.

---

## Features

* Disk usage monitoring with threshold alerts
* System health reporting (CPU, memory, uptime)
* Critical service monitoring
* Automated log cleanup
* Automated system backups
* Structured logging for maintenance tasks
* Cron-based scheduling for automation
* Modular Bash scripts for maintainability

---

## Project Structure

```
server-maintenance-system/
│
├── scripts/
│   ├── colors.sh
│   ├── disk_monitor.sh
│   ├── system_health.sh
│   ├── service_monitor.sh
│   ├── log_cleanup.sh
│   ├── backup.sh
│   └── run_maintenance.sh
│
├── logs/
│
├── reports/
│
├── backups/
│
├── config/
│
├── setup.sh
├── README.md
└── .gitignore
```

---

## Script Descriptions

### colors.sh

Provides reusable terminal color functions used across scripts for better readability and structured output.

### disk_monitor.sh

Checks disk usage across mounted filesystems and logs usage statistics. Alerts when disk usage exceeds defined thresholds.

### system_health.sh

Generates a system health report including CPU usage, memory usage, system uptime, and top resource-consuming processes.

### service_monitor.sh

Checks the status of critical services and attempts to restart them if they are not running.

### log_cleanup.sh

Finds and removes old log files to prevent excessive disk consumption.

### backup.sh

Creates compressed backups of important system directories.

### run_maintenance.sh

Main orchestrator script that sequentially executes all maintenance tasks.

---

## Installation

Clone the repository:

```
git clone https://github.com/YOUR_USERNAME/server-maintenance-system.git
```

Navigate into the project directory:

```
cd server-maintenance-system
```

Make scripts executable:

```
chmod +x scripts/*.sh
```

Run the setup script:

```
./setup.sh
```

---

## Running Maintenance Manually

You can run the entire maintenance workflow manually:

```
sudo ./scripts/run_maintenance.sh
```

---

## Cron Automation

To automate maintenance tasks using Cron:

```
crontab -e
```

Add the following entry:

```
0 2 * * * /path/to/server-maintenance-system/scripts/run_maintenance.sh >> /path/to/server-maintenance-system/logs/cron.log 2>&1
```

This will run the maintenance process **daily at 2:00 AM**.

---

## Example Output

```
========================================
AUTOMATED SERVER MAINTENANCE
========================================

[INFO] Starting full maintenance run...

Running Disk Monitor...
Running System Health Check...
Running Service Monitor...
Running Log Cleanup...
Running Backup...

[SUCCESS] Maintenance completed successfully.
```

---

## DevOps Concepts Demonstrated

This project demonstrates several foundational DevOps practices:

* Linux system administration
* Bash scripting automation
* Cron job scheduling
* System monitoring
* Log management
* Backup strategies
* Script modularization
* Infrastructure maintenance automation

---

## Future Improvements

Possible enhancements for this project include:

* Email alerts for critical failures
* Slack or webhook notifications
* Configurable service monitoring
* Log rotation support
* Docker container health checks
* Monitoring integration with Prometheus or Grafana

---

## Author

Manvendra Negi
DevOps Engineering Portfolio Project

---

