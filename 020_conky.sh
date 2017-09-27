sudo apt-get -y install conky-all


mkdir -p ~/.conkyrc.d
#wget -q0- -O /tmp/tmp.zip https://dl.opendesktop.org/api/files/download/id/1465391516/137272-conky_grey.zip && unzip /tmp/tmp.zip && rm /tmp/tmp.zip

wget -qO- -O /var/tmp/aurora.tar.gz http://downloads.sourceforge.net/project/auroraconkytheme/Aurora_v3.0.4.tar.gz && tar xzvf /var/tmp/aurora.tar.gz && mv Aurora/ ~/.conkyrc.d && rm /var/tmp/aurora.tar.gz

cd /tmp
git clone https://github.com/maxiwell/conky-seamod

apt-get install -y lm-sensors hddtemp dmidecode

chmod u+s /usr/sbin/hddtemp
chmod u+s /usr/sbin/dmidecode
