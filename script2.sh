#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Tanishka Sharma Course: Open Source Software

PACKAGE="linux-base"   # change to your target package

echo "============================================"
echo " FOSS Package Inspector: $PACKAGE"
echo "--------------------------------------------"

# --- if-then-else: check installation status via dpkg ---
if dpkg -l "$PACKAGE" 2>/dev/null | grep -q '^ii'; then
    echo " STATUS  : INSTALLED"
    VERSION=$(dpkg-query -W -f='${Version}' "$PACKAGE" 2>/dev/null)
    DESCRIPTION=$(dpkg-query -W -f='${Description}' "$PACKAGE" | head -1)
    echo " Version : $VERSION"
    echo " Summary : $DESCRIPTION"
    echo " License : See /usr/share/doc/$PACKAGE/copyright"
else
    echo " STATUS  : NOT INSTALLED"
    echo " To install: sudo apt install $PACKAGE"
fi

echo "--------------------------------------------"
echo " Open Source Philosophy Note:"

# --- case statement: match package name to philosophy statement ---
case "$PACKAGE" in
    linux-base|linux-image-*)
        echo " Linux: freed computing from proprietary constraints."
        echo " Runs 96% of web servers and every supercomputer." ;;
    apache2|httpd)
        echo " Apache: the web server that built the open internet." ;;
    mysql-server|mysql)
        echo " MySQL: open source at the heart of millions of apps." ;;
    firefox)
        echo " Firefox: kept the web open when IE threatened it." ;;
    git)
        echo " Git: Torvalds built this to manage Linux itself." ;;
    python3|python)
        echo " Python: democratising programming for a generation." ;;
    *)   # default catch-all for any other package
        echo " '$PACKAGE': free to use, study, and share." ;;
esac
echo "============================================"

