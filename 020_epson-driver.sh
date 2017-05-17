# https://www.openprinting.org/driver/epson-201106w/
DRIVER_VERSION=1.0.1-1lsb3.2

wget -c --directory-prefix /var/tmp http://download.ebz.epson.net/dsc/op/stable/debian/dists/lsb3.2/main/binary-amd64/epson-inkjet-printer-201106w_${DRIVER_VERSION}_amd64.deb

dpkg -i /var/tmp/epson-inkjet-printer-201106w_${DRIVER_VERSION}_amd64.deb

apt-get -f install
