#!/bin/bash

# set to crypto mode
reg=$(mlxreg -d /dev/mst/mt4123_pciconf0 --reg_name CRYPTO_OPERATIONAL --get | grep "wrapped_crypto_operational")
echo "crypto operational reg: $reg"

echo "set crypto operational reg"
mlxreg -d /dev/mst/mt4123_pciconf0 --reg_name CRYPTO_OPERATIONAL --set "credential[0]=0x10000000, credential[1]=0x10000000, kek[0]=0x00000000"

reg=$(mlxreg -d /dev/mst/mt4123_pciconf0 --reg_name CRYPTO_OPERATIONAL --get | grep "wrapped_crypto_operational")
echo "crypto operational reg: $reg"
