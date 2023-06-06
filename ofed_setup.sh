wget -c https://content.mellanox.com/ofed/MLNX_OFED-5.8-2.0.3.0/MLNX_OFED_LINUX-5.8-2.0.3.0-ubuntu22.04-x86_64.tgz -O - | tar xz
cd MLNX_OFED_LINUX-5.8-2.0.3.0-ubuntu22.04-x86_64
sudo su
./mlnxofedinstall --all