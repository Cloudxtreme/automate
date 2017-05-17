sudo apt-get -y install --reinstall resolvconf
sudo mkdir -p /etc/resolvconf/resolv.conf.d/
sudo bash -c 'echo "nameserver 8.8.8.8" >> /etc/resolvconf/resolv.conf.d/head'
sudo /etc/init.d/resolvconf reload
