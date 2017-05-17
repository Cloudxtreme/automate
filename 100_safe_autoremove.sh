# A number of packages are due to be removed by apt, put them back on.
bash -c 'apt-mark showauto | grep -v ^lib | xargs apt-get -y install'
bash -c 'apt-mark showauto | grep libreoffice| xargs apt-get -y install'
bash -c 'apt-mark showauto | grep gnupg| xargs apt-get -y install'
bash -c 'apt-mark showauto | grep linux-image| xargs apt-get -y install'
bash -c 'apt-get -y autoremove'


