LOGNAME=${USER}
RELEASE=$(cat /etc/devuan_version)
KEYRING=/usr/share/keyrings/devuan-archive-keyring.gpg
INCLUDE="eatmydata,ccache,gnupg"
MIRROR=http://auto.mirror.devuan.org/merged

sudo apt-get install -y sbuild
sudo mkdir -p /root/.gnupg # To work around #792100
sudo sbuild-update --keygen # see #801798
sudo sbuild-adduser ${LOGNAME}
sudo usermod -g sbuild ${LOGNAME}
`newgrp sbuild`

sudo sbuild-createchroot --keyring=${KEYRING} --include=${INCLUDE} ${RELEASE} /srv/chroot/${RELEASE}-amd64-sbuild ${MIRROR}
