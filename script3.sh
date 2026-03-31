#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Tanishka Sharma Course: Open Source Software

# --- Array of system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/proc" "/sys")
KERNEL_CONFIG_DIR="/proc/sys/kernel"

echo "================================================================"
echo " Directory Audit Report -- $(date '+%d %B %Y %H:%M:%S')"
echo "================================================================"
# printf aligns columns with fixed-width format specifiers
printf "%-20s %-12s %-10s %-8s %s\n" \
       "Directory" "Permissions" "Owner" "Group" "Size"
echo "----------------------------------------------------------------"

# --- for loop: iterate over each element of the array ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-20s %-12s %-10s %-8s %s\n" \
               "$DIR" "$PERMS" "$OWNER" "$GROUP" "${SIZE:-N/A}"
    else
        printf "%-20s %s\n" "$DIR" "[ does not exist ]"
    fi
done

# --- Dedicated kernel config directory check ---
if [ -d "$KERNEL_CONFIG_DIR" ]; then
    echo ""
    echo " Kernel Config Dir: $KERNEL_CONFIG_DIR"
    PERMS=$(ls -ld "$KERNEL_CONFIG_DIR" | awk '{print $1}')
    echo " Permissions: $PERMS (world read-only; root write)"
    for TUNABLE in hostname ostype pid_max; do
        echo "   $TUNABLE = $(cat $KERNEL_CONFIG_DIR/$TUNABLE 2>/dev/null)"
    done
fi
echo "================================================================"

