#!/bin/bash
set -e
gcloud auth login
gcloud config set project your-gcp-project
gcloud logging read \
  'logName="projects/your-gcp-project/logs/cloudaudit.googleapis.com%2Factivity"' \
  --limit=20 --format=json
gcloud logging sinks create bigquery-sink \
  bigquery.googleapis.com/projects/your-gcp-project/datasets/security \
  --log-filter='logName:"cloudaudit.googleapis.com"'
echo "GCP audit export configured"

