# Cloud SOC Integration Architecture

Telemetry flows:
- Entra ID / M365 -> Sentinel (KQL) <- Defender XDR (EDR) + Intune + AIP
- Okta logs -> Okta API collector -> Sentinel / Chronicle
- AWS CloudTrail + GuardDuty + Security Hub -> Sentinel (S3 connector)
- GCP Audit Logs -> BigQuery export -> Chronicle (forwarder)
- Chronicle -> UDM -> YARA-L 2.0 detections

Orchestration:
- Sentinel Analytics Rules / Chronicle detections -> SOAR playbook
  (enrich -> assess -> contain -> document)

## Data connectors to enable
1. Sentinel: Entra ID, M365 Defender, Azure Activity, AWS S3
2. Chronicle: M365 connector, Okta via forwarder, GCP sink
3. EDR: Defender onboarding -> devices enrolled

