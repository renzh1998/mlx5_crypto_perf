#!/bin/bash

if [ $# -ne 1 ]; then
    echo "usage: bash verify_mlx5.sh <device_pcie_addr>"
    exit 1
fi

dpdk_dir=dpdk-stable-22.11.2
test_dir=$dpdk_dir/build/app/test
dev_addr=$1


reg=$(mlxreg -d /dev/mst/mt4123_pciconf0 --reg_name CRYPTO_OPERATIONAL --get | grep -oP "wrapped_crypto_going_to_commissioning\s+\|\s+\K\d{1}x\d{8}")
echo "crypto operational reg: $reg"
if [ "$reg" != "0x00000001" ]; then
    echo "crypto operational reg is not 0x00000001"
    exit 1
fi

$test_dir/dpdk-test -c 1 -n 1 -a $dev_addr,class=crypto cryptodev_mlx5_autotest