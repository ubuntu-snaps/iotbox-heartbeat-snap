#!/bin/bash
export NATS_URL=$(snapctl get nats.url)
while true; do
  BODY={\"timestamp\":\"$(date -Iseconds)\",\"hostname\":\"$(hostname)\",\"machine_id\":\"$(cat /etc/machine-id)\"}
  nats-io.nats pub iotbox.heartbeat.$(cat /etc/machine-id) $BODY
  sleep 10
done