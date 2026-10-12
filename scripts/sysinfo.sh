#!/bin/bash
# sysinfo.sh - updated system information report (enhanced: uptime, CPU load, logging)
 
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="$SCRIPT_DIR/../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/sysinfo_$(date +%Y%m%d_%H%M%S).log"
 
report() {
    echo "=============================="
    echo " System Information Report"
    echo " Generated: $(date '+%Y-%m-%d %H:%M:%S')"
    echo " User:      $(whoami)"
    echo "=============================="
    echo
 
    echo "--- Hostname ---"
    hostname
    echo
 
    echo "--- OS / Kernel ---"
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "OS:     $PRETTY_NAME"
    fi
    echo "Kernel: $(uname -r)"
    echo
 
    echo "--- Uptime ---"
    uptime -p
    echo
 
    echo "--- CPU Load (1, 5, 15 min) ---"
    read -r l1 l5 l15 _ < /proc/loadavg
    echo "$l1 $l5 $l15  ($(nproc) cores)"
    echo
 
    echo "--- Memory Usage ---"
    free -h
    echo
 
    echo "--- Disk Usage ---"
    df -h
    echo
 
    echo "Report saved to: $LOG_FILE"
}
 
report | tee "$LOG_FILE"
