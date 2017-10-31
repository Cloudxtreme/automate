apt-get -y install --reinstall resolvconf
mkdir -p /etc/resolvconf/resolv.conf.d/
bash -c 'echo "nameserver 8.8.8.8" >> /etc/resolvconf/resolv.conf.d/head'
/etc/init.d/resolvconf reload
