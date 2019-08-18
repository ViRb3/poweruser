#!/bin/bash

sudo bash -c "cat >> /boot/config.txt" <<EOF

arm_freq=1575
gpu_freq=500

# Only sets upper boundary due to Adaptive Voltage Scaling
over_voltage=5

gpu_mem=256
EOF