#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Course: Open Source Software
# Alias concept (interactive shells only; scripts use $() instead):
# alias today='date +%d\ %B\ %Y'

DATE=$(date '+%d %B %Y')
AUTHOR=$(whoami)
OUTPUT="manifesto_${AUTHOR}.txt"   # string concatenation

echo "================================================================"
echo " Open Source Manifesto Generator"
echo " Your manifesto will be saved to: $OUTPUT"
echo "================================================================"
echo ""

# --- read -p: interactive input ---
read -p " 1. Name one open-source tool you use every day: " TOOL
echo ""
read -p " 2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""
read -p " 3. Name one thing you would build and share freely: " BUILD
echo ""

# --- -z validation: ensure no answer was left blank ---
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo " Error: All three answers are required."; exit 1
fi

# --- Write to file: > creates, >> appends ---
echo "================================================================" > "$OUTPUT"
echo " OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo " Written by : $AUTHOR" >> "$OUTPUT"
echo " Date       : $DATE" >> "$OUTPUT"
echo "================================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo " I believe software should serve people, not trap them." >> "$OUTPUT"
echo " Every day I rely on $TOOL -- built for the community." >> "$OUTPUT"
echo " To me, freedom means $FREEDOM: the right to read the" >> "$OUTPUT"
echo " code on my machine, change what doesn't work, and" >> "$OUTPUT"
echo " pass improvements on to others." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo " Torvalds didn't keep Linux proprietary. Stallman didn't" >> "$OUTPUT"
echo " lock away the GNU tools. They shared because knowledge" >> "$OUTPUT"
echo " grows when given away. One day I will build $BUILD" >> "$OUTPUT"
echo " and release it freely -- because the ecosystem I benefit" >> "$OUTPUT"
echo " from deserves something back." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo " Signed: $AUTHOR | $DATE" >> "$OUTPUT"
echo "================================================================" >> "$OUTPUT"

echo " Manifesto saved to: $OUTPUT"
cat "$OUTPUT"

