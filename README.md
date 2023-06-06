## Verify and Evaluate MLX5 Crypto Driver

**Install Mellanox OFED Driver VER 5.8**
```bash
# run under root
bash ofed_setup.sh
```

**Setup DPDK 22.11**
```bash
bash dpdk_setup.sh
```

**Verify MLX5 Crypto Driver**
```bash
bash verify_mlx5.sh <CX6 Dx Pci address>
```

**Evaluate Performance**
