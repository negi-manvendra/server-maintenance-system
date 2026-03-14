#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
BOLD="\e[1m"
RESET="\e[0m"

print_header() {
echo -e "${CYAN}${BOLD}"
echo "======================================"
echo "      AUTOMATED SERVER MAINTENANCE"
echo "======================================"
echo -e "${RESET}"
}

separator() {
echo "--------------------------------------"
}

print_success() {
echo -e "${GREEN}[SUCCESS] $1${RESET}"
}

print_warning() {
echo -e "${YELLOW}[WARNING] $1${RESET}"
}

print_error() {
echo -e "${RED}[ERROR] $1${RESET}"
}

print_info() {
echo -e "${BLUE}[INFO] $1${RESET}"
}   
