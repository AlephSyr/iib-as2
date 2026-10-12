echo "=============================="
echo " System Information Report"
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
 
echo "--- Memory Usage ---"
free -h
echo
 
echo "--- Disk Usage ---"
df -h
