#!/bin/bash

set -euo pipefail

echo "AWS CloudTrail integration setup"
echo "================================"

if ! command -v aws >/dev/null 2>&1; then
    echo "ERROR: AWS CLI is not installed."
    exit 1
fi

echo "AWS CLI detected."

echo "Configured AWS identity:"
aws sts get-caller-identity

echo
echo "CloudTrail trails:"
aws cloudtrail describe-trails \
    --query 'trailList[].{Name:Name,HomeRegion:HomeRegion,MultiRegion:IsMultiRegionTrail}' \
    --output table

echo
echo "CloudTrail integration check completed."
