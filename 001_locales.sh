# Set env
apt-get -y install locales
locale-gen "en_GB.UTF-8"
export MYLANGUAGE="en_GB.UTF-8"
export MYLANG="en_GB.UTF-8"
export MYLC_ALL="en_GB.UTF-8"

echo "Europe/London" > /etc/timezone
sed -i -e "s/# ${MYLANG}\ UTF-8/${MYLANG}\ UTF-8/" /etc/locale.gen
update-locale LANG=${MYLANG}
dpkg-reconfigure --frontend=noninteractive locales

#export LANGUAGE="${MYLANGUAGE}"
#export LANG="${MYLANG}"
#export LC_ALL="${MYLC_ALL}"

