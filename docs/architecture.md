# Cloud SOC Integration Architecture

## Overview

This project provides a centralized cloud security logging architecture for AWS, Azure, and Google Cloud.

The architecture is designed to collect security telemetry from multiple cloud providers and make the data available for centralized SOC monitoring, detection engineering, investigation, and incident response.

## Cloud Sources

### AWS

AWS CloudTrail provides API activity and account-level audit events.

Primary telemetry:

- AWS API activity
- IAM activity
- Console activity
- Authentication events
- Administrative actions

Integration:

```text
AWS CloudTrail
      |
      v
Central Security Logging
      |
      v
SOC / SIEM

Azure / Entra ID
      |
      v
Microsoft Sentinel
      |
      v
SOC Detection & Response
Google Cloud Audit Logs
      |
      v
Google Chronicle
      |
      v
SOC Detection & Response
                  +----------------+
                  |      AWS       |
                  |   CloudTrail   |
                  +-------+--------+
                          |
                          v
+----------------+   +-------------------+   +----------------+
|     Azure      |-->| Central SOC / SIEM |<--|      GCP       |
| Sentinel/Entra |   | Detection & IR     |   | Audit/Chronicle|
+----------------+   +-------------------+   +----------------+
cloud-soc-integration-lab/
├── aws/
│   └── cloudtrail/
├── azure/
│   └── sentinel/
├── google/
│   └── chronicle/
├── docs/
│   └── architecture.md
├── scripts/
│   └── setup.sh
├── tests/
└── README.md

---

### Step 4 — Create the Azure Sentinel KQL query

```bash
cat > azure/sentinel/query.kql <<'EOF'
SigninLogs
| where TimeGenerated > ago(24h)
| project
    TimeGenerated,
    UserPrincipalName,
    AppDisplayName,
    IPAddress,
    Location,
    ResultType,
    ResultDescription
| order by TimeGenerated desc
