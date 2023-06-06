#!/bin/bash

# download dpdk 22.11
wget http://fast.dpdk.org/rel/dpdk-22.11.2.tar.xz
tar xf dpdk-22.11.2.tar.xz && cd dpdk-stable-22.11.2

# build dpdk
meson -Dexamples=all build
ninja -C build

# reserve huge pages
mkdir -p /dev/hugepages
mountpoint -q /dev/hugepages || mount -t hugetlbfs nodev /dev/hugepages
echo 2048 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages
echo 2048 > /sys/devices/system/node/node1/hugepages/hugepages-2048kB/nr_hugepages

echo "DPDK build finished"