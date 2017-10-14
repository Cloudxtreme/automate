# Considerations for zfs 
# http://warpmech.com/?news=zfs-tuning-arc
# https://lonesysadmin.net/2013/12/22/better-linux-disk-caching-performance-vm-dirty_ratio/
# vm.overcommit_memory -  with this set to “2”, the system should never promise more RAM+swap 
# vm.swappiness - tendency to use swap,
# vm.vfs_cache_pressure - tendency to reclaim swap space back to memory
# vfs_cache_pressure -  value larger than 100 may negative performance impact:
# https://www.kernel.org/doc/Documentation/sysctl/vm.txt

#sudo sysctl -a | grep dirty
# vm.dirty_background_bytes = 0
# vm.dirty_background_ratio = 10
# vm.dirty_bytes = 0
# vm.dirty_expire_centisecs = 3000
# vm.dirty_ratio = 20
# vm.dirty_writeback_centisecs = 500
# vm.dirtytime_expire_seconds = 43200

#sudo sysctl -a | grep ...
# vm.swappiness = 60
# vm.vfs_cache_pressure = 100
# vm.max_map_count = 65530

#sudo sysctl -a | grep overcommit
# vm.overcommit_kbytes = 0
# vm.overcommit_memory = 0
# vm.overcommit_ratio = 50

cat > /etc/sysctl.d/01-local.conf << 'EOF'
vm.max_map_count=262144
vm.swappiness=1
vm.vfs_cache_pressure=50

vm.dirty_background_ratio=5
vm.dirty_expire_centisecs=2000
vm.dirty_ratio=15

vm.overcommit_memory=2
vm.overcommit_ratio=25
EOF
