#!/bin/bash
set -e
aws configure
aws sts get-caller-identity

# CloudTrail
aws cloudtrail create-trail --name soc-trail \
  --s3-bucket-name your-soc-trail-bucket --is-multi-region-trail
aws cloudtrail start-logging --name soc-trail

# GuardDuty + Security Hub
aws guardduty create-detector --enable
aws securityhub enable-security-hub
echo "AWS integration complete"

