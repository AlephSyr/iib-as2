#!/bin/bash
<<<<<<< HEAD
# sysinfo.sh 

echo "=============================================="
echo "          SYSTEM INFORMATION REPORT           "
echo "=============================================="
echo "Date/Time:      $(date)"
echo "Hostname:       $(hostname)"
echo "OS Release:     $(cat /etc/os-release | grep -w "PRETTY_NAME" | cut -d= -f2 | tr -d '"')"
echo "Kernel Version: $(uname -r)"
echo "Uptime:        $(uptime -p)"
echo "=============================================="
echo "Memory Usage:"
free -h | awk 'NR==1{print "               " $1,$2,$3} NR==2{print "Mem (RAM):     " $2,$3,$4}'
echo "=============================================="
echo "Disk Space Usage:"
df -h --total | grep 'total' | awk '{print "Total Disk:     Size: "$2" | Used: "$3" | Free: "$4" ("$5")"}'
echo "=============================================="
=======
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
>>>>>>> feature-logging
