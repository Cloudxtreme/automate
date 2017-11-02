apt-get install -y lxdm && apt-get -y remove lxlock xscreensaver xscreensaver-data
sed -i '/^# session=.*/ s/.*/&\nsession=\/usr\/bin\/startxfce4/' /etc/lxdm/lxdm.conf

