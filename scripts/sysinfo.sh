#!/bin/bash
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
