# vm.swappiness (tendency to use swap,
# vm.vfs_cache_pressure (tendency to reclaim swap space back to memory
# vfs_cache_pressure value larger than 100 may negative performance impact: https://www.kernel.org/doc/Documentation/sysctl/vm.txt
cat > /etc/sysctl.d/01-local.conf << 'EOF'
vm.max_map_count=262144
vm.swappiness=1
vm.vfs_cache_pressure=50
EOF
