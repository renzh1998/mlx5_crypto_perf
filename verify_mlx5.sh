#!/bin/bash

if [ $# -ne 1 ]; then
    echo "usage: bash verify_mlx5.sh <device_pcie_addr>"
    exit 1
fi

dpdk_dir=dpdk-stable-22.11.2
test_dir=$dpdk_dir/build/app/test
dev_addr=$1

$test_dir/test_dpdk -c 1 -n 1 -a $dev_addr,class=crypto cryptodev_mlx5_autotest