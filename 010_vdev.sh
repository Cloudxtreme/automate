# safest to always shift to udev before installing other things.
# You can swap between udev and vdev
## /usr/share/vdev/vdev-install.sh udev | vdev

# The components are:
#    libudev1-compat, which is the library ABI-compatible with libudev 219.
#    vdevd, which is the hotplug daemon, including helpers, actions and configuration;
#    vdev-initramfs, which provides an initramfs-tools intergration. 
#      This package includes a script (/usr/share/vdev/vdev-install.sh) for 
#      making a manual choice between using vdev or udev as /dev manager.
# You can swap between udev and vdev
## /usr/share/vdev/vdev-install.sh udev | vdev

ln -s /etc/apt/sources.list-available/devuan-experimental.list /etc/apt/sources.list.d/devuan-experimental.list
apt-get update
apt-get -t experimental install libudev1-compat vdevd vdev-initramfs

rm /etc/apt/sources.list.d/devuan-experimental.list
apt-get update
