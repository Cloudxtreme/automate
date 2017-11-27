#dpkg -i /var/tmp/docker-compose/docker-compose_1.11.0-1_amd64.deb 

LATEST_URL=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep docker-compose-$(uname -s)-$(uname -m))
RELEASE=$(echo ${LATEST_URL} | awk '{split($0,a,"/"); print a[8]}')

# make a containing directory
mkdir -p /var/tmp/docker-compose-${RELEASE}
cd /var/tmp/docker-compose-${RELEASE}

cat > ./description-pak << EOF
Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a Compose file to configure your application’s services. Then, using a single command, you create and start all the services from your configuration.
EOF

cat > ./checkinstall_it.sh << EOF
set +x
# 

LATEST_URL=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep docker-compose-$(uname -s)-$(uname -m))
RELEASE=$(echo ${LATEST_URL} | awk '{split($0,a,"/"); print a[8]}')
LICENSE_URL='https://raw.githubusercontent.com/docker/compose/master/LICENSE'
wget -c ${LICENSE_URL}

# make a new temporary directory for this use
BASE_TMP_DIR=~/tmptmp/checkinstall_tmp
mkdir -p ${BASE_TMP_DIR}

# do your work
checkinstall -y --fstrans \
	--pkgname=docker-compose \
	--pkgversion=${RELEASE} \
	--pkgrelease=1 \
	--pkgarch=amd64 \
	--pkggroup=admin \
	--pkglicense=LICENSE \
	--pkgsource=${LATEST_URL} \
	--maintainer=cyteen@ring-zero.co.uk \
	--requires=docker-engine \
	-D \
	bash ./install.sh
EOF

cat > ./install.sh << EOF
set +x
# Download and copy the latest version to /usr/local/bin and make executable
curl -o /usr/local/bin/docker-compose -L https://api.github.com/repos/docker/compose/releases/latest && chmod +x /usr/local/bin/docker-compose
EOF

bash ./checkinstall_it.sh
