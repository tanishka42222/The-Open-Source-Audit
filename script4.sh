#!/bin/bash
# Script 4: Log File Analyser
# Author: Tanishka Sharma Course: Open Source Software
# Usage: ./script4_log_analyser.sh <logfile> [keyword]

LOGFILE=$1
KEYWORD=${2:-"error"}   # default if $2 not provided
COUNT=0 ; TOTAL=0

# --- Validate arguments ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"; exit 1
fi
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."; exit 1
fi

echo "================================================================"
echo " Log File Analyser | File: $LOGFILE | Keyword: '$KEYWORD'"
echo "================================================================"

# --- Do-while style: retry if file is empty ---
MAX_RETRIES=3; RETRIES=0
while [ ! -s "$LOGFILE" ]; do
    RETRIES=$((RETRIES + 1))
    [ "$RETRIES" -ge "$MAX_RETRIES" ] && echo "Giving up." && exit 1
    read -p " File is empty. Enter alternative path: " LOGFILE
done

# --- Main loop: read file line by line ---
while IFS= read -r LINE; do
    TOTAL=$((TOTAL + 1))
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo " Total lines read   : $TOTAL"
echo " Lines with keyword : $COUNT"
[ "$TOTAL" -gt 0 ] && echo " Match rate         : $((COUNT * 100 / TOTAL))%"
echo ""
