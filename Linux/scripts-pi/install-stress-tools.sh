#!/bin/bash
#
# Install stress test tools
#

sudo apt install stress sysbench -y

wget "https://raw.githubusercontent.com/ssvb/cpuburn-arm/master/cpuburn-a53.S"
gcc -o cpuburn-a53 cpuburn-a53.S
rm cpuburn-a53.S