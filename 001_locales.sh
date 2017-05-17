# Set env
apt-get -y install locales

export MYLANGUAGE="en_GB.UTF-8"
export MYLANG="en_GB.UTF-8"
export MYLC_ALL="en_GB.UTF-8"

# /etc/environment deprecated
#echo "LANGUAGE="${MYLANGUAGE}"" > /etc/environment
#echo "LANG="${MYLANG}"" >> /etc/environment
#echo "LC_ALL="${MYLC_ALL}"" >> /etc/environment

echo "Europe/London" > /etc/timezone
sed -i -e "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen
#sed -i -e "s/# ${MYLANG} UTF-8/${MYLANG} UTF-8/" /etc/locale.
sed -i -e "s/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/" /etc/locale.gen
echo LANG="${MYLANG}">/etc/default/locale
dpkg-reconfigure --frontend=noninteractive locales
export LANGUAGE="en_GB.UTF-8"
export LANG="en_GB.UTF-8"
#export LC_ALL="en_GB.UTF-8"
#update-locale LANG=${MYLANG}
update-locale LANG=en_GB.UTF-8
