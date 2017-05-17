ZZ_VERSION=0.17.0	
cd /var/tmp
wget -c https://github.com/oetiker/znapzend/releases/download/v${ZZ_VERSION}/znapzend-${ZZ_VERSION}.tar.gz
tar zxvf znapzend-${ZZ_VERSION}.tar.gz
cd znapzend-${ZZ_VERSION}
./configure --prefix=/opt/znapzend-${ZZ_VERSION}
make
checkinstall --fstrans=no bash -c 'make install && for x in /opt/znapzend-0.17.0/bin/*; do ln -s $x /usr/local/bin; done'

# rm -rf znapzend-${ZZ_VERSION}
