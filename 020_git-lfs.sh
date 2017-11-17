#!/usr/bin/env bash
set -x
# Using in combination with bfg to remove large binary files from a git repo and replace them with a pointer to a uri/url
# debianized repo
# git clone https://github.com/git-lfs/git-lfs

#dist=$(lsb_release -c | cut -f2)
dist=$(cat /etc/devuan_version | awk -F '/' {'print $1'})
if [ "$dist" == 'jessie' ]
then 
	DIST='jessie'
elif [ "$dist" == 'ascii' ]
then 
	DIST='stretch'
else [ "$dist" == 'ceres' ] 
	DIST='sid'
fi

OS=debian

DEST=/etc/apt/sources.list-available
LINK=/etc/apt/sources.list.d
mkdir -p ${DEST}
mkdir -p ${LINK}

cat > ${DEST}/git-lfs.list << EOF
deb https://packagecloud.io/github/git-lfs/${OS}/ ${DIST} main
deb-src https://packagecloud.io/github/git-lfs/${OS}/ ${DIST} main
EOF

ln -sf ${DEST}/git-lfs.list ${LINK}/git-lfs.list

gpg_key_url="https://packagecloud.io/github/git-lfs/gpgkey"

echo -n "Importing packagecloud gpg key... "
  # import the gpg key
  curl -L "${gpg_key_url}" 2> /dev/null | apt-key add - &>/dev/null
echo "done."

apt-get update

apt-get install -y git-lfs
apt-get -f install -y
