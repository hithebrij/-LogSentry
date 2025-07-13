#!/bin/bash

# 🛰️ LogSentry – Advanced Log Analyzer & Alerting Script
# Author: Brijendra Pratap Singh
# Version: 1.0
# Description: Scans system logs and sends categorized alerts via email

# ========== CONFIGURATION ==========
EMAIL="you@example.com"       # Replace with your email
LOG_DIR="/var/log"
TMP_REPORT="/tmp/log_alert_$(date +%F_%H%M).log"
HOSTNAME=$(hostname)

# ========== PATTERNS TO MONITOR ==========
declare -A patterns
patterns["SSH Failures"]="Failed password|Invalid user"
patterns["Sudo Errors"]="sudo: .*authentication failure"
patterns["Cron Errors"]="CRON.*error|CRON.*failure"
patterns["Apache Errors"]="\\[error\\]"
patterns["Kernel Warnings"]="kernel:.*warn"

# ========== FUNCTIONS ==========

scan_logs() {
    echo "🛰️ LogSentry Alert Report - $(date)" > "$TMP_REPORT"
    echo "Hostname: $HOSTNAME" >> "$TMP_REPORT"
    echo "----------------------------------------" >> "$TMP_REPORT"

    for category in "${!patterns[@]}"; do
        echo -e "\n🔍 $category" >> "$TMP_REPORT"
        grep -E -i "${patterns[$category]}" $LOG_DIR/* 2>/dev/null | tail -n 10 >> "$TMP_REPORT"
    done

    echo -e "\n📦 End of Report\n" >> "$TMP_REPORT"
}

send_email_alert() {
    if [ -s "$TMP_REPORT" ]; then
        mail -s "[LogSentry] Log Alert - $HOSTNAME" "$EMAIL" < "$TMP_REPORT"
        echo "📧 Email sent to $EMAIL"
    else
        echo "📭 No alert content to send."
    fi
}

cleanup() {
    rm -f "$TMP_REPORT"
}

# ========== MAIN ==========

scan_logs
send_email_alert
# Uncomment the next line to clean the temp report after sending
# cleanup
