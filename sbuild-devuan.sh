#!/bin/bash

LOGNAME=${USER}
RELEASE=$(awk -F '/' \{'print $1'\} < /etc/devuan_version | awk '$1=$1')
KEYRING=/usr/share/keyrings/devuan-archive-keyring.gpg
INCLUDE="eatmydata,ccache,gnupg,debhelper,autotools-dev"
MIRROR=http://pkgmaster.devuan.org/merged

apt-get install -y sbuild
mkdir -p /root/.gnupg # To work around #792100
sbuild-update --keygen # see #801798
sbuild-adduser "${LOGNAME}"
usermod -g sbuild "${LOGNAME}"
#$(newgrp sbuild)

sbuild-createchroot --keyring="${KEYRING}" --include="${INCLUDE}" "${RELEASE}" /srv/chroot/"${RELEASE}"-amd64-sbuild "${MIRROR}"
