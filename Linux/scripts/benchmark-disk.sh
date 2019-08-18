#!/bin/bash
#
# Benchmark a disk
#

sync; sysctl -w vm.drop_caches=3
dd if=/dev/zero of=tempfile bs=1M count=1024

sync; sysctl -w vm.drop_caches=3
dd if=tempfile of=/dev/null bs=1M count=1024
