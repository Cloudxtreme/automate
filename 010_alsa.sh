apt-get -y remove --purge pulseaudio pulseaudio-module-x11 pulseaudio-utils pavucontrol gstreamer0.10-pulseaudio paman pavumeter pavucontrol

kill -9 `ps aux | grep -v grep | grep start-pulseaudio | awk {'print $2'}`
kill -9 `ps aux | grep -v grep | grep pulseaudio | awk {'print $2'}`

bash -c "rm /etc/asound.conf"
rm ~/.pulse-cookie
rm -r ~/.config/pulse
rm -rf /tmp/pulse*

apt-get -y install alsa-base alsa-tools alsa-tools-gui alsa-utils alsa-oss alsamixergui libalsaplayer0
apt-get -y install pnmixer

/etc/init.d/alsa-utils restart

kill -HUP `ps aux | grep -v grep | grep pnmixer | awk {'print $2'}`
sed -i 's,^\(VolumeControlCommand=\).*,\1'xfce4-mixer',' ~/.config/pnmixer/config
pnmixer &
