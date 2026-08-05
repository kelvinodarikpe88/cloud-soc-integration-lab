#!/bin/bash
set -e
az login
az group create --name rg-soc-lab --location eastus
az monitor log-analytics workspace create \
  --resource-group rg-soc-lab --workspace-name law-soc
az resource create \
  --resource-group rg-soc-lab \
  --resource-type "Microsoft.OperationalInsights/workspaces/providers/Microsoft.SecurityInsights" \
  --name "law-soc/default" --properties '{}'
echo "Azure + Sentinel complete - enable connectors in portal"

