#!/bin/bash
export NATS_URL=$(snapctl get nats.url)
while true; do
  TS=$(date -Iseconds)
  MACHINE_ID=$(cat /etc/machine-id)
  HOSTNAME=$(hostname)
  FQDN=$(hostname -f)
  ADDRESSES=$(hostname -I)
  MSG={\"timestamp\":\"$TS\",\"machine_id\":\"$MACHINE_ID\",\"hostname\":\"$HOSTNAME\",\"fqdn\":\"$FQDN\",\"addresses\":\"$ADDRESSES\"}
  nats pub iotbox.heartbeat.$MACHINE_ID $MSG
  sleep 10
done