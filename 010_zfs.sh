# All the zfs packages in debian stretch
apt-get install -y dkms busybox-static
apt-get install -y initramfs-tools dh-autoreconf
apt-get install -y spl spl-dkms 
apt-get install -y zfs-dkms zfs-initramfs 
apt-get install -y zfs-zed
modprobe zfs
