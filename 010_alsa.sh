sudo apt-get -y remove --purge pulseaudio pulseaudio-module-x11 pulseaudio-utils pavucontrol gstreamer0.10-pulseaudio paman pavumeter pavucontrol

sudo kill -9 `ps aux | grep -v grep | grep start-pulseaudio | awk {'print $2'}`
sudo kill -9 `ps aux | grep -v grep | grep pulseaudio | awk {'print $2'}`

sudo bash -c "rm /etc/asound.conf"
rm ~/.pulse-cookie
rm -r ~/.config/pulse
sudo rm -rf /tmp/pulse*

sudo apt-get -y install alsa-base alsa-tools alsa-tools-gui alsa-utils alsa-oss alsamixergui libalsaplayer0
sudo apt-get -y install pnmixer

sudo /etc/init.d/alsa-utils restart

kill -HUP `ps aux | grep -v grep | grep pnmixer | awk {'print $2'}`
sed -i 's,^\(VolumeControlCommand=\).*,\1'xfce4-mixer',' ~/.config/pnmixer/config
pnmixer &
