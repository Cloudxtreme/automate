# Install salt
# ascii/stretch version  2016.11.2+ds-1
# ceres version          2017.7.1+ds-1
# saltstack repo version 2017.7.1+ds-1

# Jessie
# Pin to minor release
# wget -O - https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
# deb http://repo.saltstack.com/apt/debian/8/amd64/latest jessie main

# Pin  to major version
# wget -O - https://repo.saltstack.com/apt/debian/8/amd64/2017.7/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
# deb http://repo.saltstack.com/apt/debian/8/amd64/2017.7 jessie main

# Pin to latest release
# wget -O - https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
# deb http://repo.saltstack.com/apt/debian/8/amd64/latest jessie main

# Stretch
# Pin to minor release
# wget -O - https://repo.saltstack.com/apt/debian/9/amd64/archive/2017.7.1/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
# deb http://repo.saltstack.com/apt/debian/9/amd64/archive/2017.7.1 stretch main

# Pin to major version
# wget -O - https://repo.saltstack.com/apt/debian/9/amd64/2017.7/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
# deb http://repo.saltstack.com/apt/debian/9/amd64/2017.7 stretch main

# Pin to latest release
# wget -O - https://repo.saltstack.com/apt/debian/9/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
# deb http://repo.saltstack.com/apt/debian/9/amd64/latest stretch main

DEBIAN_VERSION=8
DEBIAN_RELEASE=jessie

#DEBIAN_VERSION=9
#DEBIAN_RELEASE=stretch

SALT_VERSION=2016.3 
SALT_VERSION=2016.11 
SALT_VERSION=2017.7 
SALT_VERSION=archive/2017.7.1 
SALT_VERSION=latest 

REFRESHED_AT=2017-09-31

mkdir -p /etc/apt/sources.list-available
#sudo bash -c "wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -"
wget -O - https://repo.saltstack.com/apt/debian/${DEBIAN_VERSION}/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

# NB Packages now have dh-systemd deps and --with-systemd treat as debian upstream
echo "#wget -O - https://repo.saltstack.com/apt/debian/${DEBIAN_VERSION}/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -" >> /etc/apt/sources.list-available/saltstack-${DEBIAN_RELEASE}.list
echo "deb http://repo.saltstack.com/apt/debian/${DEBIAN_VERSION}/amd64/${SALT_VERSION} ${DEBIAN_VERSION} main" > /etc/apt/sources.list-available/saltstack-${DEBIAN_RELEASE}.list
#ln -s /etc/apt/sources.list-available/saltstack-${DEBIAN_RELEASE}.list /etc/apt/sources.list.d/saltstack-${DEBIAN_RELEASE}.list

# Upgrade The System
apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold

# salt-api 			- Generic, modular network access system
# salt-cloud 			- public cloud VM management system
# salt-common 			- shared libraries that salt requires for all packages
# salt-doc 			- additional documentation for salt, the distributed remote execution system
# salt-master 			- remote manager to administer servers via salt
# salt-minion 			- client package for salt, the distributed remote execution system
# salt-proxy 			- Proxy client package for salt stack
# salt-ssh 			- remote manager to administer servers via Salt SSH
# salt-syndic 			- master-of-masters for salt, the distributed remote execution system
# salt-formula-kubernetes 	- Salt formula for Kubernetes
# salt-formula-ceilometer 	- Salt formula for OpenStack Ceilometer
# salt-formula-cinder 		- Salt formula for OpenStack Cinder
# salt-formula-glance 		- Salt formula for OpenStack Glance
# salt-formula-heat 		- Salt formula for OpenStack Heat
# salt-formula-horizon 		- Salt formula for OpenStack Horizon
# salt-formula-keystone 	- Salt formula for OpenStack Keystone
# salt-formula-neutron 		- Salt formula for OpenStack Neutron
# salt-formula-nova 		- Salt formula for OpenStack Nova
# salt-formula-swift 		- Salt formula for OpenStack Swift


# Install Salt Dependencies
apt-get install -y -o DPkg::Options::=--force-confold \ 
	python \ 
	apt-utils \
	python-software-properties \ 
	software-properties-common \ 
	python-yaml \ 
	python-m2crypto \ 
	python-crypto \ 
	python-msgpack \ 
	python-zmq \ 
	python2.7-doc \
	python-jinja2 \ 
	python-requests 

sudo apt-get -y install salt-client

# Salt-master
apt-get install -yq -o -o DPkg::Options::=--force-confold --no-install-recommends \
	salt-master \
	salt-api \
	salt-ssh \
	salt-syndic \
	salt-cloud \
	reclass \
	python-apt \
	python-git \
	python-openssl \
	python-cherrypy3 \
	git \ 
	openssh-client \ 
	make

# Or get the development version
# apt-get upgrade -y -o DPkg::Options::=--force-confold && \
# apt-get install -y -o DPkg::Options::=--force-confold curl
# curl -L https://bootstrap.saltstack.com | sh -s -- -X git develop
