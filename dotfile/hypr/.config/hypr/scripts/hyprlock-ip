#!/usr/bin/env bash
IP=$(echo "$(ip route get 1.1.1.1 | awk '{print $7; exit}' || "Disconnected")")
echo "$IP"
