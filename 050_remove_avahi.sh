# removing any more of avahi need rebuilding of libpurple libgnomevfs libgnome2
bash -c "update-rc.d avahi-daemon disable"
apt-get -y remove --purge cups-browsed avahi-autoipd

echo " This stops the avahi daemon but the dependencies of any of the libavahi reach throught to just about all desktop packages."
#apt-get -y remove --purge libavahi-common-data libavahi-common3 avahi-daemon libavahi-glib1 libavahi-client3


