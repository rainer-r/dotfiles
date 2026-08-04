#!/usr/bin/env bash
TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader 2>/dev/null)
echo " ${TEMP}°C"
