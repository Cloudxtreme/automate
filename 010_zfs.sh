# All the zfs packages in debian stretch
apt-get install -y dkms busybox-static
apt-get install -y initramfs-tools dh-autoreconf
apt-get install -y spl spl-dkms 
apt-get install -y zfs-dkms zfs-initramfs 
apt-get install -y zfs-zed

# linux default, mount partitions even if non-empty, the no option really only makes sense if the directory being mounted on has been declared as a mount point only and is therefore guaranteed to be empty.
sed -i "s,^\(DO_OVERLAY_MOUNTS=\).*,\1\'yes\'," /etc/default/zfs

modprobe zfs
