# to remove you need to specify the version of libudev1 to downgrade
# apt-cache policy libudev1
# apt-get install udev libudev1=232-25+deb9u1
ln -s /etc/apt/sources.list-available/devuan_experimental.list /etc/apt/sources.list.d/devuan_experimental.list
apt-get update
apt-get policy eudev
apt-get -t experimental install eudev

rm /etc/apt/sources.list.d/devuan_experimental.list
apt-get update
