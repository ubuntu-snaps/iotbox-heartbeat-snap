#!/bin/bash
export NATS_URL=$(snapctl get nats.url)
NATS=/snap/bin/nats-io.nats
while true; do
  BODY={\"timestamp\":\"$(date -Iseconds)\",\"hostname\":\"$(hostname)\",\"machine_id\":\"$(cat /etc/machine-id)\"}
  $NATS pub iotbox.heartbeat.$(cat /etc/machine-id) $BODY
  sleep 10
done