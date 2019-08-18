#!/bin/bash
#
# Monitor temperature
#

while true
do
    vcgencmd measure_clock arm
    vcgencmd measure_temp
    vcgencmd measure_volts core
    sleep 1
done