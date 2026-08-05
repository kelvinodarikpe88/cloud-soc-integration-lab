# Cloud SOC Integration Lab — Architecture

## Overview

This lab demonstrates a cloud security operations architecture integrating:

- Microsoft Azure
- Microsoft Sentinel
- AWS
- Google Cloud / Chronicle
- Security automation
- Detection engineering
- CI/CD validation

## Architecture

```text
Cloud Sources
    |
    +-- Azure
    |     +-- Entra ID
    |     +-- Microsoft Sentinel
    |
    +-- AWS
    |     +-- CloudTrail
    |
    +-- Google Cloud
          +-- Chronicle / Google SecOps
    |
    v
Detection Layer
    |
    +-- KQL
    +-- YARA-L
    +-- Automation
    |
    v
SOC Investigation
    |
    v
SOAR / Incident Response
