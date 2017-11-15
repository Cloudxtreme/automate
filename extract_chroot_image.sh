# Extract an image from devuan released images for use in mobile phone chroots.

# Fetch the image, for Samsung S4 we need a armhf image.
#https://files.devuan.org/devuan_jessie/embedded/devuan_jessie_1.0.0_armhf_sunxi.img.xz
#https://files.devuan.org/devuan_jessie/embedded/devuan_jessie_1.0.0_armhf_raspi2.img.xz
#https://files.devuan.org/devuan_jessie/embedded/devuan_jessie_1.0.0_armhf_odroidxu.img.xz
#https://files.devuan.org/devuan_jessie/embedded/devuan_jessie_1.0.0_armhf_n900.img.xz
#https://files.devuan.org/devuan_jessie/embedded/devuan_jessie_1.0.0_armhf_chromeveyron.img.xz
#https://files.devuan.org/devuan_jessie/embedded/devuan_jessie_1.0.0_armhf_chromeacer.img.xz

FILE_URL=https://files.devuan.org/devuan_jessie/embedded
XZIMAGE=$1|devuan_jessie_1.0.0_armhf_sunxi.img.xz
IMAGE=${XZIMAGE%\.*}

wget -c ${FILE_URL}/${XZIMAGE}

# uncompress
unxz ${XZIMAGE}

# Mount the partitions
apt-get install -y kpartx

 kpartx -a -v ${IMAGE}

TMP_MNT=/tmp/kpartx-mnt
mkdir -p ${TMP_MNT}

mount /dev/mapper/loop0p2 ${TMP_MNT}

tar czvf linux-rootfs.tar.gz -C ${TMP_MNT} .

umount ${TMP_MNT}
rm ${IMAGE}
