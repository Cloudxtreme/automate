#    From version 0.128, the boot code waits for a suspend/resume device
#    to appear, rather than checking just once.  If the configured or
#    automatically selected resume device is not available at boot time,
#    this results in a roughly 30 second delay.

# I: The initramfs will attempt to resume from /dev/sda2
# I: (UUID=f4d19cc8-2c3e-4061-a618-7974cb88bfec)


#    You should set the RESUME variable in
INITRAMFS_HOME=/etc/initramfs-tools/conf.d/

DEVICE=/dev/sda2
UUID=f4d19cc8-2c3e-4061-a618-7974cb88bfec
RESUME="RESUME=none"
RESUME="RESUME=UUID=${UUID}"
RESUME="RESUME=/dev/${DEVICE}"
RESUME="RESUME=auto"


echo "${RESUME}" > ${INITRAMFS_HOME}/resume
