#!/bin/bash
export NATS_URL=$(snapctl get nats.url)
NATS=/snap/bin/nats-io.nats
while true; do
  TS=$(date -Iseconds)
  MACHINE_ID=$(cat /etc/machine-id)
  HOSTNAME=$(hostname)
  FQDN=$(hostname -f)
  ADDRESSES=$(hostname -I)
  MSG={\"timestamp\":\"$TS\",\"machine_id\":\"$MACHINE_ID\",\"hostname\":\"$HOSTNAME\",\"fqdn\":\"$FQDN\",\"addresses\":\"$ADDRESSES\"}
  $NATS pub iotbox.heartbeat.$(cat /etc/machine-id) $MSG
  sleep 10
done