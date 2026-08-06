#!/bin/bash

set -euo pipefail

echo "Cloud SOC Integration Lab"
echo "========================="

echo
echo "Checking project structure..."

required_dirs=(
    "aws/cloudtrail"
    "azure/sentinel"
    "google/chronicle"
    "docs"
    "scripts"
)

for directory in "${required_dirs[@]}"; do
    if [ -d "$directory" ]; then
        echo "[OK] $directory"
    else
        echo "[FAIL] $directory"
        exit 1
    fi
done

echo
echo "Cloud SOC integration structure is ready."
echo
echo "AWS:     aws/cloudtrail/"
echo "Azure:   azure/sentinel/"
echo "Google:  google/chronicle/"
echo "Docs:    docs/"
echo "Scripts: scripts/"
