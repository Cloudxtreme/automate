apt-get install mbuffer

## Using checkinstall
#ZZ_VERSION=0.17.0	
#cd /var/tmp
#wget -c https://github.com/oetiker/znapzend/releases/download/v${ZZ_VERSION}/znapzend-${ZZ_VERSION}.tar.gz
#tar zxvf znapzend-${ZZ_VERSION}.tar.gz
#cd znapzend-${ZZ_VERSION}
#./configure --prefix=/opt/znapzend-${ZZ_VERSION}
#make
#checkinstall --fstrans=no bash -c 'make install && for x in /opt/znapzend-0.17.0/bin/*; do ln -s $x /usr/local/bin; done'

# rm -rf znapzend-${ZZ_VERSION}

# Using dpkg-buildpackage
ZFS_BUILD_HOME=/var/tmp/zfs-auto-snapshot
mkdir -p ${ZFS_BUILD_HOME} 
cd ${ZFS_BUILD_HOME}
git clone https://github.com/oetiker/znapzend/
cd znapzend

git clone https://github.com/Gregy/znapzend-debian /tmp/debian
mv /tmp/debian/debian ${ZFS_BUILD_HOME}/znapzend
rm -rf /tmp/debian

sed -i -e 's/--with=systemd//g' debian/rules
sed -i -e '/override_dh_installinit:/,+1d' debian/rules 

sed -i -e 's/, dh-systemd (.*)//; s/dh-systemd (.*)//; s/, dh-systemd//;' debian/control
sed -i -e 's/dh-systemd (.*)//; s/dh-systemd//' debian/control
	
dpkg-buildpackage -b -uc -us && \
	dpkg -i ../znapzend_*.deb

## EXAMPLES
## create a complex backup task
#znapzendzetup create --recursive --mbuffer=/usr/bin/mbuffer \
#   --mbuffersize=1G --tsformat='%Y-%m-%d-%H%M%S' \
#   --pre-snap-command="/bin/sh /usr/local/bin/lock_flush_db.sh" \
#   --post-snap-command="/bin/sh /usr/local/bin/unlock_db.sh" \
#   SRC '7d=>1h,30d=>4h,90d=>1d' rpool/home \
#   DST:a '7d=>1h,30d=>4h,90d=>1d,1y=>1w,10y=>1month' backup/home \
#   DST:b '7d=>1h,30d=>4h,90d=>1d,1y=>1w,10y=>1month' root@bserv:backup/home "/root/znapzend.sh dst_b pool on" "/root/znapzend.sh dst_b pool off"

## copy the setup from one fileset to another
# znapzendzetup export rpool/home | znapzendzetup import --write rpool/new_home
