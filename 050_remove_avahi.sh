# removing any more of avahi need rebuilding of libpurple libgnomevfs libgnome2
bash -c "update-rc.d avahi-daemon disable"
apt-get -y remove --purge cups-browsed
apt-get -y remove --purge avahi-autoipd libavahi-common-data libavahi-common3 avahi-daemon libavahi-glib1 libavahi-client3


