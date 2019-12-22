#!/bin/bash
#
# Setup USH over USB, Raspberry Pi Zero W
#

if [ ! ${1} ]
then
    echo "/boot path not supplied"
    exit
fi

if [ ! -f "$1/cmdline.txt" ] || [ ! -f "$1/config.txt" ]; then
    echo "Bad path"
    exit
fi

if [ ! -f "$1/ssh" ]; then
    touch "$1/ssh"
fi

dt=$(grep -o "dtoverlay=dwc2" "$1/config.txt")
if [ "$dt" != "dtoverlay=dwc2" ]; then
    echo "dtoverlay=dwc2" >> "$1/config.txt"
fi

mod=$(grep -o "modules-load=dwc2,g_ether" "$1/cmdline.txt")
if [ "$mod" != "modules-load=dwc2,g_ether" ]; then
    sed -i "s/rootwait/& modules-load=dwc2,g_ether/g" "$1/cmdline.txt"
fi
