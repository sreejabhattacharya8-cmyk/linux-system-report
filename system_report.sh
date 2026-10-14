#!/usr/bin/env bash
# Linux System Report Generator
# Collects basic system information and writes it to system-report.txt.

set -u

OUTPUT_FILE="${1:-system-report.txt}"

{
    echo "========================================"
    echo "        LINUX SYSTEM REPORT"
    echo "========================================"
    echo "Generated at : $(date '+%Y-%m-%d %H:%M:%S %Z')"
    echo

    echo "1. HOSTNAME"
    echo "----------------------------------------"
    hostname 2>/dev/null || echo "Hostname unavailable"
    echo

    echo "2. KERNEL VERSION"
    echo "----------------------------------------"
    uname -srmo 2>/dev/null || uname -a
    echo

    echo "3. DISK USAGE"
    echo "----------------------------------------"
    df -hP 2>/dev/null || echo "Disk usage unavailable"
    echo

    echo "4. MEMORY USAGE"
    echo "----------------------------------------"
    if command -v free >/dev/null 2>&1; then
        free -h
    elif [[ -r /proc/meminfo ]]; then
        cat /proc/meminfo
    else
        echo "Memory usage unavailable"
    fi
    echo

    echo "5. TOP RUNNING PROCESSES (by CPU usage)"
    echo "----------------------------------------"
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu 2>/dev/null | head -n 11 \
        || echo "Process information unavailable"
    echo
    echo "========================================"
    echo "Report saved to: ${OUTPUT_FILE}"
    echo "========================================"
} > "$OUTPUT_FILE"

if [[ $? -eq 0 ]]; then
    echo "System report generated successfully: $OUTPUT_FILE"
else
    echo "Error: Could not write report to '$OUTPUT_FILE'." >&2
    exit 1
fi
