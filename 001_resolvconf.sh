apt-get -y install --reinstall resolvconf
mkdir -p /etc/resolvconf/resolv.conf.d/
bash -c 'echo "nameserver 52.174.55.168 >> /etc/resolvconf/resolv.conf.d/head'
bash -c 'echo "nameserver 188.165.200.156" >> /etc/resolvconf/resolv.conf.d/head'
/etc/init.d/resolvconf reload
