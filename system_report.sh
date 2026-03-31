#!/bin/bash
# Script 1: System Identity Report                                                                                                                   # Author: [Your Name] | Course: Open Source Software
# Purpose: Display a formatted welcome screen with live system info
 
# --- Variables: customise these ---
STUDENT_NAME="Tanishka"
SOFTWARE_CHOICE="Linux Kernel"
LICENSE="GNU General Public License version 2 (GPLv2)"
 
# --- Command substitution: capture live system data ---
KERNEL=$(uname -r)                              # kernel version
USER_NAME=$(whoami)                             # logged-in user
USER_HOME=$(eval echo ~$USER_NAME)              # home directory
UPTIME=$(uptime -p)                             # human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')  # formatted date/time
 
# --- Read distro name from /etc/os-release ---
DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d'"' -f2)
 
# --- Display formatted output using echo ---
echo "================================================================"
echo "      OPEN SOURCE AUDIT --- System Identity Report"
echo "================================================================"
echo "  Student      : $STUDENT_NAME"
echo "  Software     : $SOFTWARE_CHOICE"
echo "================================================================"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $USER_HOME"
echo "  Uptime       : $UPTIME"
echo "  Date/Time    : $CURRENT_DATE"
echo ""
echo "  License  : $LICENSE"
echo "  This OS is free software: study, modify, and redistribute"
echo "  it under the terms of the GPLv2."
echo "================================================================"   how shall I run this