#!/bin/bash

LOG_FILE="/usr/local/scripts/kube-vip-sync.log"

echo "-----" >> "$LOG_FILE"
echo "$(date) kube-vip sync starting" >> "$LOG_FILE"

REMOTE_VERSION=$(curl -m 10 -s https://raw.githubusercontent.com/rbmfullerton-ca/homelab/refs/heads/main/modules/kube-vip/kube-vip.yaml | grep "image: ghcr.io/kube-vip/kube-vip:" | grep -o "v[0-9]\+\.[0-9]\+\.[0-9]\+" | head -n1)

LOCAL_VERSION=$(grep "image: ghcr.io/kube-vip/kube-vip:" /var/lib/rancher/k3s/server/manifests/kube-vip.yaml | grep -o "v[0-9]\+\.[0-9]\+\.[0-9]\+" | head -n1)

echo "Remote: $REMOTE_VERSION" >> "$LOG_FILE"
echo "Local : $LOCAL_VERSION" >> "$LOG_FILE"

if [ -z "$REMOTE_VERSION" ] || [ -z "$LOCAL_VERSION" ]; then
  echo "ERROR: missing version" >> "$LOG_FILE"
  exit 0
fi

if [ "$REMOTE_VERSION" != "$LOCAL_VERSION" ]; then
  echo "UPDATE: $LOCAL_VERSION → $REMOTE_VERSION" >> "$LOG_FILE"

  sed -i "s/$LOCAL_VERSION/$REMOTE_VERSION/g" \
    /var/lib/rancher/k3s/server/manifests/kube-vip.yaml
else
  echo "No change" >> "$LOG_FILE"
fi
