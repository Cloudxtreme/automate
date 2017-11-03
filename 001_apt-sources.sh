# avoid duplicates
rm /etc/apt/sources.list
rm /etc/apt/sources.list.d/devuan

ACTIVE=/etc/apt/sources.list.d/
AVAILABLE=/etc/apt/sources.list-available/
mkdir -p "${AVAILABLE}"

GROUPS=(main contrib non-free)
ACTIVE_LIST=('devuan_ascii' 'devuan_ascii-security' 'devuan_ascii-updates' 'devuan_ascii-backports')
INACTIVE_LIST=('devuan_jessie' 'devuan_jessie-security' 'devuan_jessie-updates' 'devuan_jessie-backports' 'devuan_beowulf' 'devuan_beowulf-security' 'devuan_beowulf-updates' 'devuan_beowulf-backports' 'devuan_ceres' 'devuan_experimental')

echo ${#ACTIVE_LIST[@]}
for RELEASE in "${ACTIVE_LIST[@]}"; do
	echo "${RELEASE}"
	bash -c "cat > ${AVAILABLE}/${RELEASE}.list" <<EOF
deb http://pkgmaster.devuan.org/merged/ "${RELEASE}" "${GROUPS[@]}"
deb-src http://pkgmaster.devuan.org/merged/ "${RELEASE}" "${GROUPS[@]}"
EOF
ln -sf "${AVAILABLE}"/"${RELEASE}".list "${ACTIVE}"/"${RELEASE}".list
done

echo ${#INACTIVE_LIST[@]}
for RELEASE in "${INACTIVE_LIST[@]}"; do
	echo "${RELEASE}"
	bash -c "cat > ${AVAILABLE}/${RELEASE}.list" <<EOF
deb http://pkgmaster.devuan.org/merged/ "${RELEASE}" "${GROUPS[@]}"
deb-src http://pkgmaster.devuan.org/merged/ "${RELEASE}" "${GROUPS[@]}"
EOF
done

bash -c "cat > ${AVAILABLE}/saltstack.list" <<EOF
# wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -

deb http://debian.saltstack.com/debian stretch-saltstack main
EOF
ln -sf "${AVAILABLE}"/saltstack.list "${ACTIVE}"/saltstack.list
wget -q -O- http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key | apt-key add -

# the docker packages have go over to systemd so these wont install
bash -c cat > "${AVAILABLE}"/docker.list <<EOF
#apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Debian stretch
deb http://apt.dockerproject.org/repo debian-stretch main
EOF
ln -sf "${AVAILABLE}"/docker.list "${ACTIVE}"/docker.list
bash -c "apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D"

apt-get update && apt-get install -y --force-yes devuan-keyring

#bash -c "cat > /etc/apt/sources.list.d/x2go.list" <<'EOF'
## apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
## X2Go Repository (release builds)
#deb http://packages.x2go.org/debian jessie main
#
## X2Go Repository (sources of release builds)
#deb-src http://packages.x2go.org/debian jessie main
#
## X2Go Repository (nightly builds)
##deb http://packages.x2go.org/debian jessie heuler
#
## X2Go Repository (sources of nightly builds)
##deb-src http://packages.x2go.org/debian jessie heuler
#
## apt-get install x2goserver x2goserver-xsession
#EOF
