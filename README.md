# Cloud SOC Integration Lab

Multi-cloud Security Operations Center (SOC) integration lab demonstrating
SIEM, SOAR, and EDR integration across Microsoft Azure, AWS, and Google Cloud.

## What This Lab Covers

| Layer | Tools | Cloud |
|-------|-------|-------|
| SIEM | Microsoft Sentinel (KQL) | Azure |
| SIEM | Google SecOps / Chronicle (YARA-L 2.0) | GCP |
| EDR | Microsoft Defender XDR | Azure |
| SOAR | Sentinel Playbooks / Chronicle SOAR | Azure / GCP |
| Audit Logs | CloudTrail + GuardDuty | AWS |
| Identity | Entra ID + Okta | Azure |

## Architecture

See [docs/architecture.md](docs/architecture.md)

## Repository Structure

```text
cloud-soc-integration-lab/
├── README.md
├── docs/
│   └── architecture.md
├── azure/
│   └── sentinel/
│       └── query.kql
├── aws/
│   └── cloudtrail/
│       └── setup.sh
├── google/
│   └── chronicle/
│       └── detection.yaral
├── scripts/
│   └── setup.sh
└── tests/
    └── test_integrations.py

