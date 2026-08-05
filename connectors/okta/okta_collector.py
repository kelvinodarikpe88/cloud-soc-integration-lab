#!/usr/bin/env python3
"""Fetch Okta logs and print failures for SIEM integration testing."""
import os
import requests
from datetime import datetime, timedelta

ORG, TOKEN = os.environ["OKTA_ORG"], os.environ["OKTA_TOKEN"]
since = (datetime.utcnow() - timedelta(hours=1)).strftime("%Y-%m-%dT%H:%M:%S.000Z")

r = requests.get(
    f"https://{ORG}.okta.com/api/v1/logs",
    headers={"Authorization": f"SSWS {TOKEN}"},
    params={"since": since, "limit": 200},
)
r.raise_for_status()
events = r.json()
failures = [e for e in events if e["outcome"]["result"] == "FAILURE"]
print(f"Fetched {len(events)} events, {len(failures)} failures")
for f in failures[:5]:
    print(f["actor"]["alternateId"], f["eventType"], f["outcome"].get("reason"))

