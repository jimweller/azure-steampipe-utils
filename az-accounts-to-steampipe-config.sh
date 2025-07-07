#!/bin/sh

# Assumes you are logged into azure (and maybe PIM'd to greater access)

cat <<'EOM'
connection "mcg_all" {
  type        = "aggregator"
  plugin      = "azure"
  connections = ["*"]
}
EOM

 az account list | jq -r '.[] | "connection \"\(.name | gsub("-"; "_"))\" {\n  plugin          = \"azure\"\n  subscription_id = \"\(.id)\"\n}"'