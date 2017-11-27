#!/usr/bin/env bash
#dpkg -i /var/tmp/docker-compose/docker-compose_1.11.0-1_amd64.deb 

BASE_URL='https://api.github.com/repos'
BASE_USER='docker'
BASE_REPO='compose'
RELEASES_URL="${BASE_URL}/${BASE_USER}/${BASE_REPO}"/releases
CONTENT=$(curl -s ${RELEASES_URL}/latest)
RELEASE=$(echo "${CONTENT}" | jq --raw-output '.tag_name')

# make a containing directory
mkdir -p /var/tmp/docker-compose-"${RELEASE}"
cd /var/tmp/docker-compose-"${RELEASE}" || exit

cat > ./description-pak << EOF
Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a Compose file to configure your application’s services. Then, using a single command, you create and start all the services from your configuration.
EOF

cat > ./checkinstall_it.sh << 'EOF'

echo "ENTERING CHECKINSTALL"

BASE_URL='https://api.github.com/repos'
BASE_USER='docker'
BASE_REPO='compose'
LICENSE_PAGE_URL="${BASE_URL}/${BASE_USER}/${BASE_REPO}"/license
RELEASES_URL="${BASE_URL}/${BASE_USER}/${BASE_REPO}"/releases
CONTENT=$(curl -s ${RELEASES_URL}/latest)
LATEST_URL=$(echo "${CONTENT}" | jq --raw-output '.assets[] | select(.browser_download_url | test("Linux-x86_64")) | .browser_download_url')

echo "LATEST_URL: " "${LATEST_URL}"

RELEASE=$(echo "${CONTENT}" | jq --raw-output '.tag_name')

LICENSE_URL=$(curl "${LICENSE_PAGE_URL}" | jq --raw-output '.download_url')
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

cat > ./install.sh << 'EOF'
BASE_URL='https://api.github.com/repos'
BASE_USER='docker'
BASE_REPO='compose'
RELEASES_URL="${BASE_URL}/${BASE_USER}/${BASE_REPO}"/releases
CONTENT=$(curl -s ${RELEASES_URL}/latest)
LATEST_URL=$(echo "${CONTENT}" | jq --raw-output '.assets[] | select(.browser_download_url | test("Linux-x86_64")) | .browser_download_url')

# Download and copy the latest version to /usr/local/bin and make executable
curl -s -o /usr/local/bin/docker-compose -L ${LATEST_URL} && chmod +x /usr/local/bin/docker-compose
EOF

bash ./checkinstall_it.sh

docker-compose --version
