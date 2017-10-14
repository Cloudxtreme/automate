RELEASE=unstable
KEYRING=/usr/share/keyrings/devuan-archive-keyring.gpg
INCLUDE="eatmydata,ccache,gnupg"
MIRROR=http://auto.mirror.devuan.org/merged

sudo sbuild-createchroot --keyring=${KEYRING} --include=${INCLUDE} ${RELEASE} /srv/chroot/${RELEASE}-amd64-sbuild ${MIRROR}
